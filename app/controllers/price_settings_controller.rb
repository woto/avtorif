class PriceSettingsController < ApplicationController
  # GET /price_settings
  # GET /price_settings.xml
  def index
    @price_settings = PriceSetting.where(:supplier_id => params[:supplier_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @price_settings }
    end
  end

  # GET /price_settings/1
  # GET /price_settings/1.xml
  def show
    @price_setting = PriceSetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @price_setting }
    end
  end

  # GET /price_settings/new
  # GET /price_settings/new.xml
  def new
    @price_setting = PriceSetting.new
    @price_setting.supplier_id = params[:supplier_id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @price_setting }
    end
  end

  # GET /price_settings/1/edit
  def edit
    @price_setting = PriceSetting.find(params[:id])
  end

  def send_to_web_service
    client = Savon::Client.new do |wsdl, http|
       wsdl.document = "#{AppConfig.lc_ws_address}/trade.1cws?wsdl"
       http.auth.basic AppConfig.lc_ws_login, AppConfig.lc_ws_password
    end
    
    client.request :wsdl, :add_modify_price do |r|
      r.body = {
        "ID" => @price_setting.id.to_s,
        "SuplierID" => @price_setting.supplier_id.to_s,
        "CurrencyCode" => @price_setting.currency_buy.foreign_id.to_s, 
        "Presents" => @price_setting.presence.to_s, 
        "Delivery" => @price_setting.delivery_summary.to_s,
        "description" => @price_setting.title.to_s,
        :order! => ["ID", "SuplierID", "CurrencyCode", "Presents", "Delivery", "description"]
      }
    end
  end
  # POST /price_settings
  # POST /price_settings.xml
  def create
    @price_setting = PriceSetting.new(params[:price_setting])
    @price_setting.supplier_id = params[:supplier_id]

    respond_to do |format|
      if @price_setting.save
        send_to_web_service
        format.html { redirect_to(supplier_jobs_path(params[:supplier_id]), :notice => 'Price setting was successfully created.') }
        format.xml  { render :xml => @price_setting, :status => :created, :location => @price_setting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @price_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /price_settings/1
  # PUT /price_settings/1.xml
  def update
    @price_setting = PriceSetting.find(params[:id])
    @price_setting.supplier_id = params[:supplier_id]

    respond_to do |format|
      if @price_setting.update_attributes(params[:price_setting])
        send_to_web_service
        format.html { redirect_to(supplier_jobs_path(params[:supplier_id]), :notice => 'Price setting was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @price_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /price_settings/1
  # DELETE /price_settings/1.xml
  def destroy
    @price_setting = PriceSetting.find(params[:id])
    @price_setting.destroy

    respond_to do |format|
      format.html { redirect_to(price_settings_url) }
      format.xml  { head :ok }
    end
  end
end
