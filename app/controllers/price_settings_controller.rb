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

  def send_to_web_service(format)
    client = Savon::Client.new do |wsdl, http|
       wsdl.document = "#{AppConfig.lc_ws_address}/trade.1cws?wsdl"
       http.auth.basic AppConfig.lc_ws_login, AppConfig.lc_ws_password
    end
    result = client.request :wsdl, :add_modify_price do |r|
      r.body = {
         "ID" => @price_setting.id.to_s,
         "SuplierID" => @price_setting.supplier_id.to_s,
         "CurrencyCode" => @price_setting.currency_buy.foreign_id.to_s, 
         "Presents" => @price_setting.presence == true ? '1' : '0', 
         "Delivery" => @price_setting.delivery_summary.to_s,
         "description" => @price_setting.title.to_s,
         :order! => ["ins0:ID", "ins0:SuplierID", "ins0:CurrencyCode", "ins0:Presents", "ins0:Delivery", "ins0:description"]
      }
    end
    if result.to_hash[:add_modify_price_response][:return] != "Good"
      format.html { render :text => result.to_hash[:add_modify_price_response][:return] }
      return false
    end

    return true
  end

  # POST /price_settings
  # POST /price_settings.xml
  def create
    @price_setting = PriceSetting.new(params[:price_setting])
    @price_setting.supplier_id = params[:supplier_id]
    respond_to do |format|
      if @price_setting.save
        if send_to_web_service(format)
	  format.html { redirect_to(supplier_jobs_path(params[:supplier_id]), :notice => 'Price setting was successfully created.') }
          format.xml  { render :xml => @price_setting, :status => :created, :location => @price_setting }
        end
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
        if send_to_web_service(format)
          format.html { redirect_to(supplier_jobs_path(params[:supplier_id]), :notice => 'Price setting was successfully updated.') }
          format.xml  { head :ok }
        end
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
      format.html { redirect_to(supplier_jobs_path(params[:supplier_id])) }
      format.xml  { head :ok }
    end
  end

  def clean
    price_setting = params[:id]
    CommonModule::all_doublets do |l|
      query = "DELETE FROM price_cost_#{l} WHERE price_setting_id = #{price_setting}"
      ActiveRecord::Base.connection.execute(query)
    end
    redirect_to(supplier_jobs_path(params[:supplier_id]), :notice => 'Содержимое прайса успешно очищено')
  end
 
  def copy
    @price_setting = PriceSetting.find(params[:id])
    #@jobable = @price_setting.currency_buy
    new_price_setting = @price_setting.clone
    new_price_setting.title = new_price_setting.title + " КОПИЯ"
    new_price_setting.save
    redirect_to(supplier_jobs_path(params[:supplier_id]), :notice => 'Копия прайса успешно создана')
  end

  def download
#    self.response_body =  proc{ |response, output|
#      10_000_000.times do |i|
#        output.write "Hello world"
#        debugger
#      end
#    }
#  end

   filename = "price.csv"

   headers['Pragma'] = 'public'
   headers["Content-type"] = "text/plain" 
   headers['Cache-Control'] = 'no-cache, must-revalidate, post-check=0, pre-check=0'
   headers['Content-Disposition'] = "attachment; filename=\"#{filename}\"" 
   headers['Expires'] = "0" 

   price_setting = params[:id]

   self.response_body = proc { |response, output|
     CommonModule::all_doublets do |l|
       query = "
         SELECT pc.catalog_number_orig, pc.catalog_number, pc.manufacturer_orig, pc.manufacturer, pc.title, pc.count, pc.price_cost * ij.income_rate * (c_buy.value * ps.relative_buy_rate + ps.absolute_buy_rate) * ps.weight_unavailable_rate AS income_cost FROM price_cost_#{l} pc
         JOIN jobs j ON j.id = pc.job_id
         JOIN import_jobs ij ON j.jobable_id = ij.id
         JOIN price_settings ps ON pc.price_setting_id = ps.id 
         JOIN currencies c_buy ON c_buy.id = ps.currency_buy_id
         WHERE pc.price_setting_id = #{price_setting}"
       result = ActiveRecord::Base.connection.execute(query)
       csv = nil
       result.each do |r| 
         #FasterCSV.generate(:col_sep => "\t", :quote_char => "\x0", :row_sep => "\r\n") do |csv|
         FasterCSV.generate do |csv|
           #tmpstr = r.map{|x| x.present? ? x : "_"}
           #csv << tmpstr
           csv << r
         end
         #output.write Iconv.iconv("WINDOWS-1251//IGNORE", "UTF-8", csv.string)
         output.write csv.string
       end
     end
   }
 end

end
