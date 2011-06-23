require 'rubygems'
require 'libxml'
require 'ruby-debug'
require 'yaml'
# то ли вывалился в ruby 1.9, то ли я его плагином ставил
# в любом случае пока не нужен
#require 'xmlsimple'
require 'benchmark'

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
          if block && !@private_cache[key]["with"][manufacturer]['yield']
            @private_cache[key]["with"][manufacturer]['yield'] = true
            block.call( @private_cache[key]["with"][manufacturer]) 
          end
          return
        end
      else
        if @private_cache[key]["with"].size > 0
          @private_cache[key]["with"].each_pair do |manufacturer, value|
            if block && !@private_cache[key]["with"][manufacturer]['yield']
              @private_cache[key]["with"][manufacturer]['yield'] = true
              block.call(value)
            end
          end
        end
        # Все группы
        if @private_cache[key]["without"].key? "catalog_number"
          if block && !@private_cache[key]["without"]["yield"]
            @private_cache[key]["without"]["yield"] = true
            block.call(@private_cache[key]["without"]) 
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

      # Независимо от того что запросят мы запомниаем искомый номер с или без производителя
      # а потом уже в повторном вызове в нужном порядке отдается сначала с производителем, а потом, в случае нужды
      # без (изменение внесено так же в этом коммите)

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
            "image_url" => row['image_url'],
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
            "image_url" => row['image_url'],
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

  class SaxReader
    include LibXML::XML::SaxParser::Callbacks
    include Enumerable

    def initialize(string)
      @parser = LibXML::XML::SaxParser.string(string)
      @parser.callbacks = self
    end

    def each(&block)
      @start_element_proc = block
      @parser.parse
    end

    def on_characters text
      text = text.force_encoding('utf-8')

      if @inside_detail_item
        if @once_for_detail_item
          @p = Hash.new
          
          @p["title"] = ''          
          @p["title_en"] = ''
          
          @p["supplier_title"] = 'emex'
          @p["supplier_title_en"] = 'emex'
          @p["supplier_title_full"] = 'emex'
          @p["supplier_inn"] = 7716542310
          @p["supplier_kpp"] = 771601001
          @p["job_title"] ="ws"
          @p["job_import_job_kilo_price"] = 0
          # TODO Уточнить будет ли когда-нибудь информация о весе отдаваться?
          #p["weight_grams"] = z.css('DetailWeight').text
          @p["weight_grams"] = 0
          @p["ps_weight_unavailable_rate"] = 1
          @p["ps_absolute_weight_rate"] = 0
          @p["ps_relative_weight_rate"] = 0
          @p["c_weight_value"] = 1
          @p["ps_kilo_price"] = 0
          @p["ps_absolute_buy_rate"] = 0
          @p["ps_relative_buy_rate"] = 1
          @p["c_buy_value"] = 1
          @p["ij_income_rate"] = 1
          @p["currency"] = 643

          @once_for_detail_item = false
        end

        if @inside_detail_info
          if @inside_detail_num
            @p["catalog_number"] = CommonModule::normalize_catalog_number(text)
            @p["catalog_number_orig"] = text
          elsif @inside_make_name
            @p["manufacturer"] = CommonModule::find_manufacturer_synonym(text, -2, true)[1..-2]
            @p["manufacturer_orig"] = text
          elsif @inside_make_logo
            @p["manufacturer_short"] = text
          elsif @inside_destination_logo
            @p["logo"] = text
            @p["job_import_job_destination_logo"] = text
            @p["job_import_job_delivery_summary"] = text
          elsif @inside_destination_desc
            @p["job_import_job_destination_summary"] = text
          elsif @inside_price_logo
            @p["price_logo_emex"] = text
          elsif @inside_detail_name_rus
            @p["title"] = text
          elsif @inside_detail_name_eng
            @p["title_en"] = text
          elsif @inside_calc_delivery_percent
            @p["job_import_job_success_percent"] = text
            @p["success_percent"] = text
          elsif @inside_ad_days
            @p["job_import_job_delivery_days_declared"] = text
          elsif @inside_deliver_time_guaranteed
            @p["job_import_job_delivery_days_average"] = text
          elsif @inside_bit_original
            if text == 'true'
              @p["bit_original"] = 1
            else
              @p["bit_original"] = 0
            end
          elsif @inside_bit_storehouse
            if text == 'true'
              @p["job_import_job_presence"] = 1
            else
              @p["job_import_job_presence"] = 0
            end
          elsif @inside_quantity_text
            @p["count"] = CGI.unescapeHTML(text)
          elsif @inside_price_desc
            @p["job_import_job_country"] = text
          elsif @inside_price_country
            @p["job_import_job_country_short"] = text
          end
        elsif @inside_prices
          if @inside_result_price
            @p["price_cost"] = text
            income_cost = text.to_f * 1
            @p["income_cost"] = income_cost
            retail_rate = 1.55
            @p["ps_retail_rate"] = retail_rate
            @p["retail_cost"] = income_cost * retail_rate
          end
        end
      end
    end

    def on_start_element(element, attributes)
      #progress(element, attributes)
      if element == 'DetailItem'
        @inside_detail_item = true
        @once_for_detail_item = true
      elsif element == 'DetailInfo'
        @inside_detail_info = true
      elsif element == "Prices"
        @inside_prices = true
      elsif element == 'DetailNum'
        @inside_detail_num = true
      elsif element == 'MakeName'
        @inside_make_name = true
      elsif element == 'MakeLogo'
        @inside_make_logo = true
      elsif element == 'DestinationLogo'
        @inside_destination_logo = true
      elsif element == "DestinationDesc"
        @inside_destination_desc = true
      elsif element == 'PriceLogo'
        @inside_price_logo = true
      elsif element == "ResultPrice"
        @inside_result_price = true
      elsif element == 'DetailNameRus'
        @inside_detail_name_rus = true
      elsif element == 'DetailNameEng'
        @inside_detail_name_eng = true
      elsif element == "CalcDeliveryPercent"
        @inside_calc_delivery_percent = true
      elsif element == "ADDays"
        @inside_ad_days = true 
      elsif element == 'DeliverTimeGuaranteed'
        @inside_deliver_time_guaranteed = true
      elsif element == "bitOriginal"
        @inside_bit_original = true
      elsif element == 'bitStorehouse'
        @inside_bit_storehouse = true
      elsif element == 'QuantityText'
        @inside_quantity_text = true
      elsif element == 'PriceDesc'
        @inside_price_desc = true
      elsif element == 'PriceCountry'
        @inside_price_country = true        
      end
    end

    def on_end_element(element)
      if element == 'DetailItem'
        @inside_detail_item = false
        @start_element_proc.call(@p)
      elsif element == 'DetailInfo'
        @inside_detail_info = false
      elsif element == 'Prices'
        @inside_prices = false
      elsif element == 'DetailNum'
        @inside_detail_num = false
      elsif element == 'MakeName'
        @inside_make_name = false
      elsif element == 'MakeLogo'
        @inside_make_logo = false
      elsif element == 'DestinationLogo'
        @inside_destination_logo = false
      elsif element == "DestinationDesc"
        @inside_destination_desc = false
      elsif element == "PriceLogo"
        @inside_price_logo = false
      elsif element == "ResultPrice"
        @inside_result_price = false
      elsif element == 'DetailNameRus'
        @inside_detail_name_rus = false
      elsif element == 'DetailNameEng'
        @inside_detail_name_eng = false
      elsif element == "CalcDeliveryPercent"
        @inside_calc_delivery_percent = false 
      elsif element == "ADDays"
        @inside_ad_days = false
      elsif element == 'DeliverTimeGuaranteed'
        @inside_deliver_time_guaranteed = false
      elsif element == "bitOriginal"
        @inside_bit_original = false
      elsif element == 'bitStorehouse'
        @inside_bit_storehouse = false
      elsif element == 'QuantityText'
        @inside_quantity_text = false
      elsif element == 'PriceDesc'
        @inside_price_desc = false
      elsif element == 'PriceCountry'
        @inside_price_country = false        
      end
    end
  end

  def search
    @header = []
    @result_message = "Ок"
    @result_prices = []
    @result_replacements = []

    result_message = lambda{@result_message}
    result_replacements = lambda{@result_replacements}
    result_prices = lambda{@result_prices}
    @result = lambda{{:result_message => result_message.call, :result_replacements => result_replacements.call, :result_prices => result_prices.call}}

    catch :halt do

      if params[:catalog_number].nil?
        throw :halt
      end

      begin
        latinized_catalog_number = CommonModule::convert_all_cyr_to_lat(params[:catalog_number])
        our_catalog_number = CommonModule::normalize_catalog_number(latinized_catalog_number)
        # По идее от этой строчки надо избавиться, но когда убрал всплыло то, что возвращается NULL и тут обрезается
        # до UL, я не совсем правильно написал метод и использую его в различных целях в разных местах, 
        # поэтому чтобы сохранить работоспособность пришлось вернуть как было. Еще в момент написания уже подумывал разбить
        # на два метода, экранирующий и не экранирующий
        if params[:manufacturer].present? && params[:manufacturer].size > 0
          our_manufacturer = CommonModule::find_manufacturer_synonym(params[:manufacturer], -1, false)[1..-2]
        end
      rescue ManufacturerException, CatalogNumberException => e
        @result_message = e.message
        throw :halt
      end

      get_from_catalog(our_catalog_number, our_manufacturer) do |r1|
        @result_replacements << r1
      end
      
      if params[:replacements] == '1'
        @result_replacements.map.each do |r1|
          r1['replacements'].each do |replacement|
            get_from_catalog(replacement['catalog_number'], replacement['manufacturer']) do |r2|
              if replacement['manufacturer']
                @result_replacements.unshift(r2)
              else
                @result_replacements.push(r2)
              end
            end
          end
        end
      end


      # Работа со сторонними сервисами

      once = true
      if(params[:ext_ws] == '1')
        #EMEX
        begin
          Timeout.timeout(AppConfig.emex_timeout) do

            emex_response = ''
            measurement = Benchmark.measure do
              emex_response = CommonModule::get_emex(
                :catalog_number => our_catalog_number,
                :manufacturer => params[:manufacturer],
                :login => AppConfig.emex_login,
                :password => AppConfig.emex_password,
                :replacements => params[:replacements]
              )
            end

            puts 'Потрачено на получение xml\'я с емекс\'a'
            puts measurement

            measurement = Benchmark.measure do
              doc = SaxReader.new(emex_response)

                doc.each do |p|

                  @result_prices << p

                  found = false
                  @result_replacements.each do |replacement|
                    if replacement["catalog_number"] == p["catalog_number"]
                      if replacement["manufacturer"] == p["manufacturer"]
                        found = true
                      end
                    end
                  end

                  unless found
                    # Вставляем вначало
                    @result_replacements.unshift({
                      "catalog_number" => p["catalog_number"],
                      "manufacturer" => p["manufacturer"],
                      "title" => p["title"],
                      "title_en" => p["title_en"],
                      "original" => p["bit_original"],
                      "yield" => true
                    })
                  end

                  if once
                    once = false
                    @header = @header | p.keys
                  end

                end
            end

            puts "Потрачено на распарсивание и добавление отсутствующих замен."
            puts measurement
          end
        rescue Timeout::Error => e
          @result_message << " Превышено время ожидания ответа сайта Emex, скорее всего сервер не доступен " + e.message
        rescue SocketError => e
          @result_message << " Отсутствует соединение с сайтом Emex " + e.message
        rescue Exception => e
          @result_message << " Emex вернул не валидный xml, скорее всего доступ к сайту отсутствует " + e.message
        end
      end
      
      once = nil
      threads = []
      measurement = Benchmark.measure do
        @result_replacements.each do |replacement|
          threads << Thread.new do
            Thread.current["measurement"] = Benchmark.measure do 
              md5 = Digest::MD5.hexdigest(replacement["catalog_number"])[0,2]
              weight_grams = replacement["weight_grams"] ? replacement["weight_grams"] : "0"
              client = Mysql2::Client.new(Rails.configuration.database_configuration[Rails.env].to_options.merge({:pool => 150}))
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
              CASE
                WHEN p.weight_grams > 0 THEN p.weight_grams
                ELSE #{weight_grams}
              END as weight_grams,
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
              WHERE  p.catalog_number = '#{client.escape(replacement["catalog_number"])}'" 
              if replacement["manufacturer"]
                query << " AND p.manufacturer = '#{client.escape(replacement["manufacturer"])}'"
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

              res = client.query(query)
              client.close
              Thread.current["res"] = res.collect{|z| z}
            end
          end
        end

        threads.each do |t| 
          t.join
          res = t["res"]
          measurement = t["measurement"]
          puts measurement
          if res.size > 0
            @header = @header | res[0].keys 
            res.each do |r|
              @result_prices << r
            end
          end
        end

      end

      puts "Потрачено на выборку из локальной базы"
      puts measurement

      measurement = Benchmark.measure do
        # Пока мы до конца не избавимся от каталожного номера без производителя эта мера является необходимой
        # TODO попробуйте поищите каталожный номер с заменами 90430-12031 без этого блока.
        @reduced_prices = []
        seen = []
        @result_prices.map do |detail|
          unless seen.include? detail["id"] || detail["id"] == nil
            seen << detail["id"]
            @reduced_prices << detail
          end
        end
        @result_prices = @reduced_prices

        if @result_prices.size > 0
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
        @header = @header - ["manufacturer", "catalog_number", "income_cost", "ps_retail_rate", "real_job_id", "job_import_job_presence", "job_id", "job_import_job_country", "job_import_job_delivery_days_average", "supplier_id", "supplier_kpp", "job_import_job_country_short", "supplier_title_en", "price_cost",	"ij_income_rate",	"c_buy_value", "ps_relative_buy_rate", "ps_absolute_buy_rate", "weight_grams", "ps_kilo_price", "c_weight_value", "ps_relative_weight_rate", "ps_absolute_weight_rate", "ps_weight_unavailable_rate", "created_at", "job_import_job_delivery_summary", "price_setting_id", "min_order", "updated_at", "external_id", "unit_package", "supplier_inn", "id", "processed", "delivery_days_price", "job_import_job_kilo_price", "count", "unit", "description", "currency", "job_title",	"supplier_title",	"supplier_title_full",	"job_import_job_destination_logo",	"manufacturer_short", "price_logo_emex",	"job_import_job_destination_summary", "multiply_factor", "country", "parts_group", "applicability", "job_import_job_success_percent", "logo"]
      
      end

      puts "Потрачено на устраниение дублей, выкидывание из хедера ненужных столбцов"
      puts measurement
    end


    flash.now[:notice] = result_message.call 
    puts "В контроллере перед рендерингом"

    respond_to do |format|
      format.html {render :action => :index }
      #format.xml  { render :xml => @result.call.to_xml}
      format.xml  { render :text => @result.call}
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
