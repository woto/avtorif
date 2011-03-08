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
        if @private_cache[key][:with].key? manufacturer
          block.call( @private_cache[key][:with][manufacturer]) if block
          return
        end
      else
        # Все группы
        if @private_cache[key][:without].key? :catalog_number
          block.call(@private_cache[key][:without]) if block
        end
        if @private_cache[key][:with].size > 0
          @private_cache[key][:with].each_pair do |k, v|
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
      @client = ActiveRecord::Base.connection.instance_variable_get :@connection
      result = @client.query(query, :as => :hash)
      if manufacturer
        @private_cache[key] ||= {:with => {manufacturer => {:catalog_number => catalog_number, :manufacturer => manufacturer, :replacements => []}}, :without => []}
      else
        @private_cache[key] ||= {:with => {}, :without => {:catalog_number => catalog_number, :replacements => []}}
      end
      result.each do |row|
        # Запомнили в кеше
        # hash = {
        #   "A" => { 
        #     :without => {
        #       :catalog_number, ..., :replacemnts => {
        #         {:catalog_number => "B", :manufacturer => "M1"},
        #         {:catalog_number => "B", :manufacturer => nil}
        #       }
        #     }
        #     :with => {
        #       "M1" => {:catalog_number, ... :replacements => {...}},
        #       "M2" => {:catalog_number, ... :replacements => {...}}
        #     }
        #   }
        # }

        if row['manufacturer'].blank?

          @private_cache[key][:without] = {
            :catalog_number => row['catalog_number'],
            :manufacturer => row['manufacturer'],
            :original => row['original'],
            :title => row['title'],
            :title_en => row['title_en'],
            :weight_grams => row['weight_grams'],
            :new_catalog_number => row['new_catalog_number'],
            :replacements => []
          }

          for i in 0...AppConfig.max_replaces
            if eval "row['r#{i}'].blank?"
              break
            else
              eval "@private_cache[key][:without][:replacements] << {
                :catalog_number => row['r#{i}'], 
                :manufacturer => row['rm#{i}']
              }"
              #if recursive
              #  get_from_catalog(row["r#{i}"], row["rm#{i}"], false, &block)
              #end
            end
          end
        else
          @private_cache[key][:with][row['manufacturer']] = {
            :catalog_number => row['catalog_number'],
            :manufacturer => row['manufacturer'],
            :original => row['original'],
            :title => row['title'],
            :title_en => row['title_en'],
            :weight_grams => row['weight_grams'],
            :new_catalog_number => row['new_catalog_number'],
            :replacements => []
          }
          
          for i in 0...AppConfig.max_replaces
            if eval "row['r#{i}'].blank?"
              break
            else
              eval "@private_cache[key][:with][row['manufacturer']][:replacements] << {
                :catalog_number => row['r#{i}'], 
                :manufacturer => row['rm#{i}']
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

    @prices = []

    our_catalog_number = CommonModule::normalize_catalog_number(params[:catalog_number])

    if params[:manufacturer].present? && params[:manufacturer].size >= 1
      our_manufacturer = CommonModule::find_manufacturer_synonym(params[:manufacturer], -1, false)[1..-2]
    end

    replacements = []
      get_from_catalog(our_catalog_number, our_manufacturer) do |r1|
        replacements << r1
        if params[:replacements] == '1'
          r1[:replacements].each do |replacement|
            get_from_catalog(replacement[:catalog_number], replacement[:manufacturer]) do |r2|
              replacements << r2
            end
          end
        end
      end
    # Работа со сторонними сервисами
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

            doc = Nokogiri::XML(response)
            detail_items = doc.css('DetailItem')
            detail_items.each do |z|
              if z.blank?
                next
              end

              if z.css('CalcDeliveryPercent').text.to_i < 50
                next
              end
              
              #debugger

              p = Hash.new
              #p = Price.new
              p[:supplier_title] = 'emex'
              p[:supplier_title_en] = 'emex'
              p[:supplier_title_full] = 'emex'
              p[:supplier_inn] = 7716542310
              p[:supplier_kpp] = 771601001
              p[:job_title] ="ws"
              p[:job_import_job_kilo_price] = 0
              p[:job_import_job_presence] = false
          
              p[:job_import_job_destination_logo] = z.css('DestinationLogo').text
              p[:job_import_job_destination_summary] = z.css('DestinationDesc').text
              #p[:logo] = z.css('DestinationLogo').text
              p[:catalog_number] = CommonModule::normalize_catalog_number(z.css('DetailNum').first.text)
              p[:catalog_number_orig] = z.css('DetailNum').first.text.strip
              p[:manufacturer] = CommonModule::find_manufacturer_synonym(z.css('MakeName').text, -2, true)[1..-2]
              p[:manufacturer_orig] = z.css('MakeName').text
              p[:manufacturer_short] = z.css('MakeLogo').first.text
              p[:job_import_job_success_percent] = z.css('CalcDeliveryPercent').text
              p[:success_percent] = z.css('CalcDeliveryPercent').text
              p[:job_import_job_delivery_days_declared] = z.css('ADDays').text
              p[:job_import_job_delivery_days_average] = z.css('DeliverTimeGuaranteed').text
              p[:job_import_job_delivery_summary] = z.css('DestinationLogo').text
              p[:job_import_job_country] = z.css('PriceDesc').text
              p[:job_import_job_country_short] = z.css('PriceCountry').text
              p[:price_cost] = z.css('ResultPrice').text
              p[:income_cost] = z.css('ResultPrice').text.to_f * 1
              p[:retail_cost] = p[:income_cost] * 1.55
              p[:currency] = 643
              p[:count] = CGI.unescapeHTML(z.css('QuantityText').first.text)
              p[:title] = z.css('DetailNameRus').text
              p[:title_en] = z.css('DetailNameEng').text
              p[:weight_grams] = z.css('DetailWeight').text

              if(z.css('bitStorehouse') == 'true')
                p[:job_import_job_presence] = true
              else
                p[:job_import_job_presence] = false
              end

              if z.css('bitOriginal').text == 'true'
                p[:bit_original] = 1
              else
                p[:bit_original] = 0
              end

              @prices << p
              found = false
              replacements.each do |replacement|
                if replacement[:catalog_number] == p[:catalog_number]
                  if replacement[:manufacturer] == p[:manufacturer] || replacement[:manufacturer] == nil
                    found = true
                  end
                end
              end
              
              unless found
                replacements <<  { 
                  :catalog_number => p[:catalog_number],
                  :manufacturer => p[:manufacturer],
                  :original => p[:bit_original]
                }
              end

            end
            rescue Timeout::Error => e
          end
        end
      end
    # Локальная работа
    debugger
    replacements.each do |replacement|
      md5 = Digest::MD5.hexdigest(replacement[:catalog_number])[0,2]
      weight_grams = replacement[:weight_grams] ? replacement[:weight_grams] : "0"
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
          ij.success_percent as job_import_job_success_percent,
          '55' as success_percent,
          CASE
            WHEN p.count = 0 AND ps.presence = 1 THEN 99
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
          m.original as bit_original,
          ps.id as job_id
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
        WHERE  p.catalog_number = #{ActiveRecord::Base.connection.quote(replacement[:catalog_number])}" 
      if replacement[:manufacturer]
        query << " AND p.manufacturer = #{ActiveRecord::Base.connection.quote(replacement[:manufacturer])}"
      end

      #debugger
      result = @client.query(query, :as => :hash)
      result.each do |r|
        @prices << r
      end
    end

    query = "SELECT '1'"
    result = @client.query(query, :as => :array)

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
