class PricesController < ApplicationController

  def search
    # Локальная работа
    @prices = Price.select("prices.*, jobs.*, import_jobs.*, suppliers.*").where('catalog_number = ?', params[:price][:catalog_number]).includes(:job => {:import_job => [:currency_buy, :currency_sell, :currency_weight]}).includes(:supplier)

    # Работа со сторонними сервисами
    if(defined?(params[:OnlyOurWS]) && params[:OnlyOurWS] == "1")
      threads = []

      # ALL4CAR
      threads << Thread.new() do
        Thread.current["prices"] = []
        Timeout.timeout(AppConfig.emex_timeout) do
          begin
            response = Net::HTTP.post_form(URI.parse('http://62.5.214.110/partnersws/Service.asmx/SearchResultOneCurrencyXml'), {
              'sPartCode' => params[:price][:catalog_number], 
              'sAuthCode' => '303190193312', 
              'iReplaces' => '1', 
              'sCurrency' => 'RUR'
            })

            doc = Nokogiri::XML(response.body)
            
            places = doc.xpath('/searchResult')

            places.children.each do |place|
              unless(place.is_a?(Nokogiri::XML::Element) && ["main", "extWH", "mainWH"].include?(place.name))
                next
              end

              place.children.each do |part|
                if part.blank?
                  next
                end
                
                p = Price.new

                p.supplier = Supplier.new(
                  :title => 'a4c', 
                  :inn => 7733732181, 
                  :kpp => 773301001)

                p.job = Job.new(:title => "ws")

                p.job.import_job = ImportJob.new(
                  :income_rate => 1, 
                  :retail_rate => 1.55,
                  :kilo_price => 0,
                  :presence => false
                )

                part.children.each do |option|
                  if option.blank?
                    next
                  end
                  
                  value = CGI.unescapeHTML(option.children.to_s)

                  if option.keys.size > 0
                    option.keys.each do |key|
                      p[(option.name.underscore + "_" + key.underscore + "_a4c").to_sym] = option[key].strip
                    end
                  end
                  p[(option.name.underscore + "_a4c").to_sym] = value.strip

                  case option.name
                    when /^version$/
                      p[:created_at] = DateTime.parse(value.strip)
                      p[:updated_at] = DateTime.now
                    # TODO сделать список стандартных замен для региона (оаэ, япония, москва и т.д.)
                    when /^region$/
                      p.job.import_job[:country_short] = value.strip
                    when /^amount$/
                      p[:count] = value.strip
                    #when /^supplier$/
                    #  p[:manufacturer] = value.strip
                    when /^descr$/
                      p[:title] = value.strip
                    when /^price$/
                      p[:price_cost] = value.strip
                    when/^from$/
                      p.job.import_job[:delivery_summary] = (p.job.import_job[:delivery_summary].to_s + " " + value.strip).strip
                    when /^code$/
                      p[:catalog_number] = value.strip
                    # TODO сделать список стандартных замен (NS, Nissan, NISSAN и т.д.)
                    when /^supplier$/
                      p.job.import_job[:delivery_summary] = (p.job.import_job[:delivery_summary].to_s + " " + option['Delivery'].strip + " " + (option['info'].present? ? option['info'].strip : "")).strip
                      p[:manufacturer] = option['make'].strip
                      p.job.import_job[:country] = value.strip
                      p.job.import_job[:kilo_price] = option['kgPrice'].strip
                      p.job.import_job[:delivery_days_average] = option['supplDays100'].strip.to_i
                      p.job.import_job[:success_percent] = option['successProc'].strip
                    when /^probability$/
                      p[:success_percent] = value.strip
                    when /^srok$/
                      p.job.import_job[:delivery_days_declared] = value.strip if value.strip.present?
                    when /^days$/
                      p.job.import_job[:delivery_days_declared] = value.strip if value.strip.present?
                  end

                end

                Thread.current["prices"] << p

              end
            end
            rescue Exception => e
          end
        end
      end

      #EMEX
      threads << Thread.new() do

        Thread.current["prices"] = []
        Timeout.timeout(AppConfig.emex_timeout) do
          begin
            response = Net::HTTP.post_form(URI.parse('http://ws.emex.ru/EmExService.asmx/FindDetailAdv'), {
              'login'=>AppConfig.emex_login,
              'password'=> AppConfig.emex_password,
              'makeLogo' => 'true',
              'detailNum' => params[:price][:catalog_number],
              'findSubstitutes' => 'true'
            })

            doc = Nokogiri::XML(response.body)

            detail_items = doc.children.children
            detail_items.each do |z|

              if z.blank?
                next
              end

              p = Price.new

              p.supplier = Supplier.new(
                :title => 'emex', 
                :inn => 7716542310, 
                :kpp => 771601001
              )

              p.job = Job.new(:title => "ws")

              p.job.import_job = ImportJob.new(
                :income_rate => 1, 
                :retail_rate => 1.55,
                :kilo_price => 0,
                :presence => false
              )

              z.children.children.each do |c|

                if c.blank?
                  next
                end

                value = CGI.unescapeHTML(c.children.to_s)

                case c.name
                 when /^DestinationLogo$/
                   p.job.import_job[:delivery_summary] = (p.job.import_job[:delivery_summary].to_s + " " + value.strip).strip
                 when /^DestinationDesc$/
                   p.job.import_job[:delivery_summary] = (p.job.import_job[:delivery_summary].to_s + " " + value.strip).strip
                 when /^bitStorehouse$/
                   p.job.import_job[:presence] = true if value.strip == 'true'
                 when /^PriceCountry$/
                   p.job.import_job[:country_short] = value.strip
                 when /^PriceDesc$/
                   p.job.import_job[:country] = value.strip
                 when /^QuantityText$/
                   p[:count] = value.strip 
                 when /^DateChange$/
                   p[:created_at] = DateTime.parse(value.strip)
                   p[:updated_at] = DateTime.now
                  when /^DetailNum$/
                    p[:catalog_number] = value.strip
                  when /^DetailNameRus$/
                    p[:title] = value.strip
                  when /^DetailNameEng$/
                    p[:title_en] = value.strip
                  when /^ResultPrice$/
                    p[:price_cost] = value.strip
                  when /^MakeName$/
                    p[:manufacturer] = value.strip
                  when /^MakeLogo$/
                    p[:manufacturer_short] = value.strip
                 when /^ADDays$/
                    p.job.import_job[:delivery_days_average] = value.to_s
                 when /^DeliverTimeGuaranteed$/
                    p.job.import_job[:delivery_days_declared] = value.to_s
                 when /^CalcDeliveryPercent$/
                    p.job.import_job[:success_percent] = value.to_s
                    p[:success_percent] = value.to_s
                  when /^Country$/
                    p[:country] = value.strip
                  else
                    p[(c.name.underscore + "_emex").to_sym] = value.strip
                end

              end
              Thread.current['prices'] << p
            end
            rescue Exception => e
          end
        end
      end
      threads.each do |t|
        t.join
        #debugger
        @prices = @prices + t["prices"]
      end
    end

    respond_to do |format|
      format.html {render :action => :index }
      format.xml  { render :xml => @prices.to_xml(
        :include => {
        :supplier => {
          :except => [:fio_head, :email, :correspondent_account, :title_en, :password, :login, :current_account, :phone, :okpo, :position_head, :seller, :created_at, :emaildocs, :delivery_days, :title, :bank_title, :bik_bank, :buyer, :updated_at, :contact_info, :fio_buh, :title_full, :actual_address, :id, :contract, :fax, :legal_address, :okato, :ogrn]
        }, 
        :job => {
          :except => [ :created_at, :jobable_id, :last_start, :updated_at, :next_start, :id, :file_mask, :jobable_type, :seconds_between_jobs, :seconds_working, :supplier_id, :description, :last_finish, :job_id, :started_once, :active, :locked],
          :include => {
            :import_job => {
              :except => [:currency_weight_id, :income_price_colnum, :manufacturer_colnum, :created_at, :catalog_number_colnum, :count_colnum, :currency_buy_id, :external_id_colnum, :title_colnum, :delivery_type_id, :updated_at, :importable_type, :weight_colnum, :id, :currency_sell_id, :multiplicity_colnum, :weight_unavaliable_rate, :importable_id, :import_method],
              :include => {
                :currency_buy => {:except => [:foreign_id, :created_at, :updated_at, :id, :value]},
                :currency_sell => {:except => [:foreign_id, :created_at, :updated_at, :id, :value]},
                :currency_weight => {:except => [:foreign_id, :created_at, :updated_at, :id, :value]},
              }}}}})}
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
