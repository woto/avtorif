class CurrenciesController < ApplicationController
  # GET /currencies
  # GET /currencies.xml
  def index
    @currencies = Currency.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @currencies }
    end
  end

  # GET /currencies/1
  # GET /currencies/1.xml
  def show
    @currency = Currency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @currency }
    end
  end

  # GET /currencies/new
  # GET /currencies/new.xml
  def new
    @currency = Currency.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @currency }
    end
  end

  # GET /currencies/1/edit
  def edit
    @currency = Currency.find(params[:id])
  end

  def send_to_web_service(format)
    client = Savon::Client.new do |wsdl, http|
       wsdl.document = "#{AppConfig.lc_ws_address}/currencies.1cws?wsdl"
       http.auth.basic AppConfig.lc_ws_login, AppConfig.lc_ws_password
    end

    result = client.request :wsdl, :add_currency_rate do |r|
      r.body = {
        "currency_code" => params['currency']['foreign_id'], 
        "currencyName" => params['currency']['title'], 
        "rate" => params['currency']['value'],
        :order! => ["currency_code", "currencyName", "rate"]
      }
    end

    if result.to_hash[:add_currency_rate_response][:return] != "Good"
      render :text => result.to_hash[:add_currency_rate_response][:return]
      return false
    end

    return true
  end

  # POST /currencies
  # POST /currencies.xml
  def create
    @currency = Currency.new(params[:currency])

    respond_to do |format|
      if @currency.save
        if send_to_web_service(format)
          format.html { redirect_to(@currency, :notice => 'Currency was successfully created.') }
          format.xml  { render :xml => @currency, :status => :created, :location => @currency }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @currency.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /currencies/1
  # PUT /currencies/1.xml
  def update
    @currency = Currency.find(params[:id])

    respond_to do |format|
      if @currency.update_attributes(params[:currency])

        if send_to_web_service(format)
          format.html { redirect_to(@currency, :notice => 'Currency was successfully updated.') }
          format.xml  { head :ok }
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @currency.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /currencies/1
  # DELETE /currencies/1.xml
  def destroy
    @currency = Currency.find(params[:id])
    @currency.destroy

    respond_to do |format|
      format.html { redirect_to(currencies_url) }
      format.xml  { head :ok }
    end
  end
end
