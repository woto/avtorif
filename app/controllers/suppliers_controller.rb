# encoding: utf-8

class SuppliersController < ApplicationController
  # GET /suppliers
  # GET /suppliers.xml
  def index
    @suppliers = Supplier.order('suppliers.title').includes(:jobs)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @suppliers }
    end
  end

  # GET /suppliers/1
  # GET /suppliers/1.xml
  def show
    @supplier = Supplier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @supplier }
    end
  end

  # GET /suppliers/new
  # GET /suppliers/new.xml
  def new
    @supplier = Supplier.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @supplier }
    end
  end

  # GET /suppliers/1/edit
  def edit
    @supplier = Supplier.find(params[:id])
  end

  def send_to_web_service(format)
    client = Savon::Client.new do |wsdl, http|
       wsdl.document = "#{AppConfig.lc_ws_address}/trade.1cws?wsdl"
       http.auth.basic AppConfig.lc_ws_login, AppConfig.lc_ws_password
    end

    result = client.request :wsdl, :add_supplier do |r|
      r.body = {
        "ID" => @supplier.id.to_s,
        "title" => @supplier.title.to_s,
        "INN" => @supplier.inn.to_s,
        "KPP" => @supplier.kpp.to_s,
        "fullTitle" => @supplier.title_full.to_s,
        "seller" => @supplier.seller.to_s,
        "buyer" => @supplier.buyer.to_s,
        :order! => ["ID", "title", "INN", "KPP", "fullTitle", "seller", "buyer"]
      }
    end 

    if result.to_hash[:add_supplier_response][:return] != "Good"
      format.html { render :text => result.to_hash[:add_supplier_response][:return] }
      return false
    end

    return true
  end

  # POST /suppliers
  # POST /suppliers.xml
  def create
    @supplier = Supplier.new(params[:supplier])

    respond_to do |format|
      if @supplier.save

        if send_to_web_service format
          format.html { redirect_to(@supplier, :notice => 'Supplier was successfully created.') }
          format.xml  { render :xml => @supplier, :status => :created, :location => @supplier }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @supplier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /suppliers/1
  # PUT /suppliers/1.xml
  def update
    @supplier = Supplier.find(params[:id])

    respond_to do |format|
      if @supplier.update_attributes(params[:supplier])
        if send_to_web_service(format)
	  format.html { redirect_to(@supplier, :notice => 'Supplier was successfully updated.') }
          format.xml  { head :ok }
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @supplier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.xml
  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy

    respond_to do |format|
      format.html { redirect_to(suppliers_url) }
      format.xml  { head :ok }
    end
  end
end
