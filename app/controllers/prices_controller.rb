class PricesController < ApplicationController

  def search
    #sleep(10)
    @prices = []
    @prices = Price.find(:all, :conditions => ['catalog_number = ?', params[:price][:catalog_number]])
    
    #joe = Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345)

    #@prices << Struct.new(:catalog_number => 'b')
    if(defined?(params[:OnlyOurWS]) && params[:OnlyOurWS] == "1")
      Timeout.timeout(AppConfig.emex_timeout) do
        begin
          response = Net::HTTP.post_form(URI.parse('http://ws.emex.ru/EmExService.asmx/FindDetailAdv'),
                                    {'login'=>AppConfig.emex_login,
                                     'password'=> AppConfig.emex_password,
                                     'makeLogo' => 'true',
                                     'detailNum' => params[:price][:catalog_number],
                                     'findSubstitutes' => 'true'})
          doc = Nokogiri::XML(response.body)

          detail_items = doc.children.children
          detail_items.each do |z|
            if z.blank?
              next
            end
            p = Price.new(
              :created_at => '',
              :estimate_days => '',
              :goods_id => '',
              :id => '',
              :initial_cost => '',
              :inn => '',
              :job_id => '',
              :job_title => '',
              :kpp => '',
              :manufacturer => '',
              :margin => '',
              #:supplier => '',
              :updated_at => ''
            )

            z.children.children.each do |c|

              if c.blank?
                next
              end

              value = CGI.unescapeHTML(c.children.to_s)

              p[(c.name.underscore + "-emex").to_sym] = value
              p[:inn] = 7716542310
              p[:kpp] = 771601001
              #p['supplier'] = 'emex'
              p[:margin] = 1

              case c.name
                when /^DateChange$/
                  p[:created_at] = value
                  p[:updated_at] = value
                when /^DetailNum$/
                  p[:catalog_number] = value
                when /^QuantityText$/
                  p[:count] = value.gsub(/[><=]/, "").to_i
                when /^DetailNameRus$/
                  p[:title] = value
                when /^ResultPrice$/
                  p[:initial_cost] = value
                  p[:result_cost] = value
                when /^MakeName$/
                  p[:manufacturer] = value.to_s
                when /^DeliverTimeGuaranteed/
                  p[:estimate_days] = value.to_s
                when /^PriceDesc$/
                  p[:supplier] = value
                when /^PriceLogo$/
                  p[:job_title] = value.to_s
                when /^QuantityChangeDate$/
                  p[:updated_at] = value.to_s
              end

            end
            
            @prices.push p

          end
        rescue Exception => e
          raise e
        end
      end
    end
    #puts res.body

=begin
   /// <summary>
    /// Тест для метода FindDetailAdv сервиса Поиска детали
    /// </summary>
    private void btnDetAdv_Click(object sender, EventArgs e)
    {
    try
    {
    Test_EmExService.EmExService.DetailItem[] details = null;
    TimeSpan ts;
    using (Test_EmExService.EmExService.EmExService serv = new Test_EmExService.EmExService.EmExService())
    {
    this.textBoxExcp.Text = String.Empty;
    this.textBoxMess.Text = String.Empty;
    DateTime dt1 = DateTime.Now;

    details = serv.FindDetailAdv(<login>, "<password>", String.Empty, "357407182", true);

    DateTime dt2 = DateTime.Now;
    ts = dt2 - dt1;
    }

    this.textBoxMess.Text = String.Format("Найдено деталей: {0} за {1} mc", details.Length.ToString(), ts.TotalMilliseconds.ToString("#0.00"));
    }
    catch (Exception excp)
    {
    this.textBoxExcp.Text = excp.Message;
    }
    }

  http://ws.emex.ru/EmExService.asmx
    FindDetailAdv

    ЛОГИН:14616
    ПАРОЛЬ:2b0ffb38

=end






    respond_to do |format|
      format.html {render :action => :index }
      format.xml  { render :xml => @prices }
    end

    # 90948-01003
  end
  # GET /prices
  # GET /prices.xml
  def index
    @prices = Price.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prices }
    end
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
