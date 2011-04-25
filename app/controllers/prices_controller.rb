class PricesController < ApplicationController

  # Суть этой вакханалии сводится к тому, что из-за того, что в нашей базе много nil производителей, и много пересечений
  # по заменам, то мы хотим получить из таблицы только записи по каталожному номеру, а потом уже пригодится или не
  # пригодится производитель будем решать уже в памяти
  def get_from_catalog(catalog_number, manufacturer, &block)
    puts "@@@@@@@@@@@@@@@@@ " + catalog_number.to_s + " " + manufacturer.to_s + " @@@@@@@@@@@@@@@@@"
    key = catalog_number.to_s
    @private_cache ||= Hash.new
    if @private_cache.key? key
      if manufacturer
        if @private_cache[key]["with"].key? manufacturer
          block.call( @private_cache[key]["with"][manufacturer]) if block
          return
        end
      else
        # Все группы
        if @private_cache[key]["without"].key? "catalog_number"
          block.call(@private_cache[key]["without"]) if block
        end
        if @private_cache[key]["with"].size > 0
          @private_cache[key]["with"].each_pair do |k, v|
            block.call(v) if block
          end
        end
        return
      end
    else
      md5 = Digest::MD5.hexdigest(catalog_number)[0,2]
      query = "SELECT price_catalog_#{md5}.*, manufacturers.original FROM price_catalog_#{md5} 
        LEFT JOIN manufacturers ON price_catalog_#{md5}.manufacturer = manufacturers.title WHERE catalog_number = " + Price.connection.quote(catalog_number)
      puts "###################### #{query}  ######################"
      #@client = ActiveRecord::Base.connection.instance_variable_get :@connection
      #result = @client.query(query, :as => :hash)
      #debugger
      result = ActiveRecord::Base.connection.select_all(query)
      if manufacturer
        @private_cache[key] ||= {"with" => {manufacturer => {"catalog_number" => catalog_number, "manufacturer" => manufacturer, "replacements" => []}}, "without" => []}
      else
        @private_cache[key] ||= {"with" => {}, "without" => {"catalog_number" => catalog_number, "replacements" => []}}
      end
      result.each do |row|
        # Запомнили в кеше
        # hash = {
        #   "A" => { 
        #     "without" => {
        #       "catalog_number", ..., "replacemnts" => {
        #         {"catalog_number" => "B", "manufacturer" => "M1"},
        #         {"catalog_number" => "B", "manufacturer" => nil}
        #       }
        #     }
        #     "with" => {
        #       "M1" => {"catalog_number", ... "replacements" => {...}},
        #       "M2" => {"catalog_number", ... "replacements" => {...}}
        #     }
        #   }
        # }

        if row['manufacturer'].blank?

          @private_cache[key]["without"] = {
            "catalog_number" => row['catalog_number'],
            "manufacturer" => row['manufacturer'],
            "original" => row['original'],
            "title" => row['title'],
            "title_en" => row['title_en'],
            "weight_grams" => row['weight_grams'],
            "new_catalog_number" => row['new_catalog_number'],
            "replacements" => []
          }

          for i in 0...AppConfig.max_replaces
            if eval "row['r#{i}'].blank?"
              break
            else
              eval "@private_cache[key]['without']['replacements'] << {
                'catalog_number' => row['r#{i}'], 
                'manufacturer' => row['rm#{i}']
              }"
              #if recursive
              #  get_from_catalog(row["r#{i}"], row["rm#{i}"], false, &block)
              #end
            end
          end
        else
          @private_cache[key]['with'][row['manufacturer']] = {
            'catalog_number' => row['catalog_number'],
            'manufacturer' => row['manufacturer'],
            'original' => row['original'],
            'title' => row['title'],
            'title_en' => row['title_en'],
            'weight_grams' => row['weight_grams'],
            'new_catalog_number' => row['new_catalog_number'],
            'replacements' => []
          }
          
          for i in 0...AppConfig.max_replaces
            if eval "row['r#{i}'].blank?"
              break
            else
              eval "@private_cache[key]['with'][row['manufacturer']]['replacements'] << {
                'catalog_number' => row['r#{i}'], 
                'manufacturer' => row['rm#{i}']
              }"
              #if recursive
              #  get_from_catalog(row["r#{i}"], row["rm#{i}"], false, &block)
              #end
            end
          end
        end
      end
      # Мы запросим еще раз, чтобы на этот раз уже получить из кеша
      get_from_catalog(catalog_number, manufacturer, &block)
    end
  end

  def search
    @header = []
    @prices = []

    if params[:catalog_number]
      begin
        latinized_catalog_number = CommonModule::convert_all_cyr_to_lat(params[:catalog_number])
        our_catalog_number = CommonModule::normalize_catalog_number(latinized_catalog_number)

        if params[:manufacturer].present? && params[:manufacturer].size >= 1
          begin
            our_manufacturer = CommonModule::find_manufacturer_synonym(params[:manufacturer], -1, false)[1..-2]
          rescue ManufacturerException
            flash.now[:notice] = "Искомый производитель деталей не существует"
            render '/prices/search_form' and return
          end  
        end



        replacements = []
        get_from_catalog(our_catalog_number, our_manufacturer) do |r1|
          replacements << r1
          if params[:replacements] == '1'
            r1['replacements'].each do |replacement|
              get_from_catalog(replacement['catalog_number'], replacement['manufacturer']) do |r2|
                replacements << r2
              end
            end
          end
        end
        # Работа со сторонними сервисами

        once = true
        if(params[:ext_ws] == '1')
          #EMEX
            Timeout.timeout(AppConfig.emex_timeout) do
              begin
                puts 'Сейчас будем читать'
                response = CommonModule::get_emex(
                  :catalog_number => our_catalog_number, 
                  :manufacturer => params[:manufacturer],
                  :login => AppConfig.emex_login,
                  :password => AppConfig.emex_password,
                  :replacements => params[:replacements]
                )
                puts 'Завершили чтение'
                #debugger
                doc = Nokogiri::XML(response)
                detail_items = doc.css('DetailItem')
                detail_items.each do |z|
                  if z.blank?
                    next
                  end

                  #if z.css('CalcDeliveryPercent').text.to_i < 50
                  #  next
                  #end
                  
              #z = Nokogiri::XML(z.to_s)
              #debugger
              p = Hash.new
              #p = Price.new
              p["supplier_title"] = 'emex'
              p["supplier_title_en"] = 'emex'
              p["supplier_title_full"] = 'emex'
              p["supplier_inn"] = 7716542310
              p["supplier_kpp"] = 771601001
              p["job_title"] ="ws"
              p["job_import_job_kilo_price"] = 0
              p["job_import_job_presence"] = false
              #debugger
              p_destination_logo = z.xpath('./xmlns:DetailInfo/xmlns:DestinationLogo').text
              p["job_import_job_destination_logo"] = p_destination_logo
              p["job_import_job_destination_summary"] = z.xpath('./xmlns:DetailInfo/xmlns:DestinationDesc').text
              #p["logo"] = p_destination_logo
              p_catalog_number = z.xpath('./xmlns:DetailInfo/xmlns:DetailNum').text
              p["catalog_number"] = CommonModule::normalize_catalog_number(p_catalog_number)
              p["catalog_number_orig"] = p_catalog_number
              p_make_name = z.xpath('./xmlns:DetailInfo/xmlns:MakeName').text
              p["manufacturer"] = CommonModule::find_manufacturer_synonym(p_make_name, -2, true)[1..-2]
              p["manufacturer_orig"] = p_make_name
              p["manufacturer_short"] = z.xpath('./xmlns:DetailInfo/xmlns:MakeLogo').text
              p_calc_delivery_percent = z.xpath('./xmlns:DetailInfo/xmlns:CalcDeliveryPercent').text
              p["job_import_job_success_percent"] = p_calc_delivery_percent
              p["success_percent"] = p_calc_delivery_percent
              p["job_import_job_delivery_days_declared"] = z.xpath('./xmlns:DetailInfo/xmlns:ADDays').text
              p["job_import_job_delivery_days_average"] = z.xpath('./xmlns:DetailInfo/xmlns:DeliverTimeGuaranteed').text
              p["job_import_job_delivery_summary"] = z.xpath('./xmlns:DetailInfo/xmlns:DestinationLogo').text
              p["job_import_job_country"] = z.xpath('./xmlns:DetailInfo/xmlns:PriceDesc').text
              p["job_import_job_country_short"] = z.xpath('./xmlns:DetailInfo/xmlns:PriceCountry').text
              p_result_price = z.xpath('./xmlns:Prices/xmlns:ResultPrice').text
              p["price_cost"] = p_result_price
              p_income_cost = p_result_price.to_f * 1
              p["income_cost"] = p_income_cost
              p_ps_retail_rate = 1.55
              p["ps_retail_rate"] = p_ps_retail_rate
              p["retail_cost"] = p_income_cost * p_ps_retail_rate
              p["currency"] = 643
              p["count"] = CGI.unescapeHTML(z.xpath('./xmlns:DetailInfo/xmlns:QuantityText').text)
              p["title"] = z.xpath('./xmlns:DetailInfo/xmlns:DetailNameRus').text
              p["title_en"] = z.xpath('./xmlns:DetailInfo/xmlns:DetailNameEng').text
              ##p["weight_grams"] = z.css('DetailWeight').text
              p["weight_grams"] = 0
              p["ps_weight_unavailable_rate"] = 1
              p["ps_absolute_weight_rate"] = 0
              p["ps_relative_weight_rate"] = 0
              p["c_weight_value"] = 1
              p["ps_kilo_price"] = 0
              p["ps_absolute_buy_rate"] = 0
              p["ps_relative_buy_rate"] = 1
              p["c_buy_value"] = 1
              p["ij_income_rate"] = 1

              if(z.xpath('./xmlns:DetailInfo/xmlns:bitStorehouse') == 'true')
                p["job_import_job_presence"] = true
              else
                p["job_import_job_presence"] = false
              end

              if z.xpath('./xmlns:DetailInfo/xmlns:bitOriginal').text == 'true'
                p["bit_original"] = 1
              else
                p["bit_original"] = 0
              end

                  @prices << p
                  found = false
                  replacements.each do |replacement|
                    if replacement["catalog_number"] == p["catalog_number"]
                      if replacement["manufacturer"] == p["manufacturer"] || replacement["manufacturer"] == nil
                        found = true
                      end
                    end
                  end
                  
                  unless found
                    replacements <<  { 
                      "catalog_number" => p["catalog_number"],
                      "manufacturer" => p["manufacturer"],
                      "original" => p["bit_original"]
                    }
                  end

                  if once
                    once = false
                    @header = @header | p.keys 
                  end

                end
                rescue Timeout::Error => e
              end
            end
          end
        once = nil
        # Локальная работа
        #debugger
        replacements.each do |replacement|
          md5 = Digest::MD5.hexdigest(replacement["catalog_number"])[0,2]
          weight_grams = replacement["weight_grams"] ? replacement["weight_grams"] : "0"
          #string_for_income_cost =  "p.price_cost * (c.value/100 * ps.relative_buy_coefficient + ps.absolute_buy_coefficient)  income_rate * c.value AS income_cost, 
          query = "
            SELECT
              p.*,
              s.title as supplier_title,
              s.title_en as supplier_title_en,
              s.title_full as supplier_title_full,
              s.inn as supplier_inn,
              s.kpp as supplier_kpp,
              ps.title as job_title,
              /* ij.success_percent as job_import_job_success_percent, */
              ps.success_percent,
              CASE
                WHEN (p.count IS NULL AND ps.presence = 1) THEN 99
                ELSE p.count
              END as count,
              ps.delivery_days_average as job_import_job_delivery_days_average,
              ps.delivery_days_declared as job_import_job_delivery_days_declared,
              ps.delivery_summary as job_import_job_delivery_summary,
              ps.presence as job_import_job_presence,
              ps.kilo_price as job_import_job_kilo_price,
              ps.country as job_import_job_country,
              ps.country_short as job_import_job_country_short,
              c_buy.foreign_id as currency,
              CASE 
                WHEN p.weight_grams > 0 THEN p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) + p.weight_grams * ps.kilo_price / 1000 * (c_weight.value * ps.relative_weight_rate + ps.absolute_weight_rate)
                WHEN #{weight_grams} > 0 THEN p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) + #{weight_grams} * ps.kilo_price / 1000 * (c_weight.value * ps.relative_weight_rate + ps.absolute_weight_rate)
                ELSE p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) * ps.weight_unavailable_rate 
              END AS income_cost,
              CASE 
                WHEN p.weight_grams > 0 THEN ps.retail_rate * (p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) + p.weight_grams * ps.kilo_price / 1000 * (c_weight.value * ps.relative_weight_rate + ps.absolute_weight_rate))
                WHEN #{weight_grams} > 0 THEN ps.retail_rate * (p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) + #{weight_grams} * ps.kilo_price / 1000 * (c_weight.value * ps.relative_weight_rate + ps.absolute_weight_rate))
                ELSE ps.retail_rate * (p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) * ps.weight_unavailable_rate)
              END AS retail_cost,
              ij.income_rate as ij_income_rate,
              c_buy.value as c_buy_value,
              ps.retail_rate as ps_retail_rate,
              ps.relative_buy_rate as ps_relative_buy_rate,
              ps.absolute_buy_rate as ps_absolute_buy_rate,
              #{weight_grams} as weight_grams,
              ps.kilo_price as ps_kilo_price,
              c_weight.value as c_weight_value,
              ps.relative_weight_rate as ps_relative_weight_rate,
              ps.absolute_weight_rate as ps_absolute_weight_rate,
              ps.weight_unavailable_rate as ps_weight_unavailable_rate,
              m.original as bit_original,
              ps.id as job_id,
              j.id as real_job_id
            FROM price_cost_#{md5} p
              LEFT JOIN manufacturers m
                ON p.manufacturer = m.title
              INNER JOIN jobs j
                ON p.job_id = j.id
              INNER JOIN price_settings ps 
                ON p.price_setting_id = ps.id 
              INNER JOIN import_jobs ij 
                ON j.jobable_id = ij.id 
              INNER JOIN suppliers s 
                ON j.supplier_id = s.id
              INNER JOIN currencies c_buy
                ON c_buy.id = ps.currency_buy_id
              INNER JOIN currencies c_weight 
                ON c_weight.id = ps.currency_weight_id
            WHERE  p.catalog_number = #{ActiveRecord::Base.connection.quote(replacement["catalog_number"])}" 
          if replacement["manufacturer"]
            query << " AND p.manufacturer = #{ActiveRecord::Base.connection.quote(replacement["manufacturer"])}"
          end
          
          if params['for_site']
            query << " AND ps.visible_for_site = 1"
          end

          if params['for_stock']
            query << " AND ps.visible_for_stock = 1"
          end

          if params['for_shop']
            query << " AND visible_for_shops = 1"
          end

          #debugger
          #result = @client.query(query, {:as => :hash, :symbolize_keys => true})
          result = ActiveRecord::Base.connection.select_all(query)
          if result.size > 0
            @header = @header | result[0].keys 
            result.each do |r|
              @prices << r
            end
          end
        end

        #query = "SELECT '1'"
        #result = @client.query(query, :as => :array)

        # Пока мы до конца не избавимся от каталожного номера без производителя эта мера является необходимой
        # TODO попробуйте поищите каталожный номер с заменами 90430-12031 без этого блока.
        @reduced_prices = []
        seen = []
        @prices.map do |detail|
          unless seen.include? detail["id"] || detail["id"] == nil
            seen << detail["id"]
            @reduced_prices << detail
          end
        end
        @prices = @reduced_prices

        if @prices.size > 0
          @header.uniq!
          ["catalog_number_orig", "manufacturer_orig", "bit_original", "title", "retail_cost",	"job_import_job_delivery_days_declared",	"success_percent", "title_en", "income_cost", "ps_retail_rate", "job_title", "supplier_title", "supplier_title_full", "supplier_title_en", "price_cost", "ij_income_rate", "c_buy_value", "ps_relative_buy_rate", "ps_absolute_buy_rate", "weight_grams", "ps_kilo_price", "c_weight_value", "ps_relative_weight_rate", "ps_absolute_weight_rate", "ps_weight_unavailable_rate", "catalog_number",  "manufacturer"].reverse.each do |key|
            begin
              @header.unshift(@header.delete_at(@header.index(key)))
            rescue => e
              raise e.to_s + " В процессе обработки #{key}"
            end
          end
        end
        
        # Выкидываем не нужные столбцы (возможно я это планировал делать где-то в другом месте, но где уже не вспомню)
        # @header = @header - ["manufacturer", "catalog_number", "income_cost", "ps_retail_rate", "real_job_id", "job_import_job_presence", "job_id", "job_import_job_country", "job_import_job_delivery_days_average", "supplier_id", "supplier_kpp", "job_import_job_country_short", "supplier_title_en", "price_cost",	"ij_income_rate",	"c_buy_value", "ps_relative_buy_rate", "ps_absolute_buy_rate", "weight_grams", "ps_kilo_price", "c_weight_value", "ps_relative_weight_rate", "ps_absolute_weight_rate", "ps_weight_unavailable_rate", "created_at", "job_import_job_delivery_summary", "price_setting_id", "min_order", "updated_at", "external_id", "unit_package", "supplier_inn", "id", "processed", "delivery_days_price", "job_import_job_kilo_price", "count", "unit", "description", "currency", "job_title",	"supplier_title",	"supplier_title_full",	"job_import_job_destination_logo",	"manufacturer_short", "price_logo_emex",	"job_import_job_destination_summary"]

      rescue CatalogNumberException
        flash.now[:notice] = 'Каталожный номер искомой детали введен не корректно'
        render '/prices/search_form' and return
      end
    end
    respond_to do |format|
      format.html {render :action => :index }
      format.xml  { render :xml => @prices.to_xml}
    end

  end

  # GET /prices
  # GET /prices.xml
  def index
    render :text => "Unavaliable"
    return

#    @prices = Price.all
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @prices }
#    end
  end

  # GET /prices/1
  # GET /prices/1.xml
  def show
    @price = Price.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @price }
    end
  end

  # GET /prices/new
  # GET /prices/new.xml
  def new
    @price = Price.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @price }
    end
  end

  # GET /prices/1/edit
  def edit
    @price = Price.find(params[:id])
  end

  # POST /prices
  # POST /prices.xml
  def create
    @price = Price.new(params[:price])

    respond_to do |format|
      if @price.save
        format.html { redirect_to(@price, :notice => 'Price was successfully created.') }
        format.xml  { render :xml => @price, :status => :created, :location => @price }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @price.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prices/1
  # PUT /prices/1.xml
  def update
    @price = Price.find(params[:id])

    respond_to do |format|
      if @price.update_attributes(params[:price])
        format.html { redirect_to(@price, :notice => 'Price was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @price.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prices/1
  # DELETE /prices/1.xml
  def destroy
    @price = Price.find(params[:id])
    @price.destroy

    respond_to do |format|
      format.html { redirect_to(prices_url) }
      format.xml  { head :ok }
    end
  end
end
