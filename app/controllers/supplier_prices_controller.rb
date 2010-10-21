class SupplierPricesController < ApplicationController
  # GET /supplier_prices
  # GET /supplier_prices.xml
  def index
    @attachments = SupplierPrice.all(:order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @attachments }
    end
  end

  # GET /supplier_prices/1
  # GET /supplier_prices/1.xml
  def show
    @attachment = SupplierPrice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attachment }
    end
  end

  # GET /supplier_prices/new
  # GET /supplier_prices/new.xml
  def new
    @attachment = SupplierPrice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attachment }
    end
  end

  # GET /supplier_prices/1/edit
  def edit
    @attachment = SupplierPrice.find(params[:id])
  end

  # POST /supplier_prices
  # POST /supplier_prices.xml
  def create

    md5 = Digest::MD5.file(params[:attachment][:attachment].path).hexdigest
    supplier_id = params[:attachment][:supplier_id]
    
    #@attachment = SupplierPrice.new(params[:attachment])
    #@attachment.md5 = Digest::MD5.hexdigest(File.read())

    if SupplierPrice.find(:first, :conditions => ['md5 = ? AND supplier_id = ?',  md5, supplier_id]).nil?
      
      @attachment = SupplierPrice.new(params[:attachment])
      @attachment.md5 = md5

      respond_to do |format|
        if @attachment.save

          #Job.all(params[:supplier_id])
          #ijs = ImportJob.find(:all, :conditions => {:job => {:supplier_id => params[:attachment][:supplier_id]}}, :joins => "INNER JOIN import_jobs ij ON ij.id = jobs.jobable_id ")
          #ijs = ImportJob.find(:all, :conditions => {:jobs => {:supplier_id => params[:attachment][:supplier_id]}}, :joins => "INNER JOIN jobs ON import_jobs.id = jobs.jobable_id ")
          ijs = ImportJob.find(:all, :conditions => {:jobs => {:supplier_id => params[:attachment][:supplier_id]}}, :joins => :job)
          ijs = ijs.select{|ij| ij.job.file_mask.match(params[:attachment][:attachment].original_filename)}
          ijs.each do |ij|
            Delayed::Job.enqueue(ImportJobber.new(ij, @attachment.id))
            #ImportJobber.new(ij, @attachment.id).perform
          end

          format.html { redirect_to(@attachment, :notice => 'SupplierPrice was successfully created.') }
          format.xml  { render :xml => @attachment, :status => :created, :location => @attachment }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @attachment.errors, :status => :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to(attachments_path, :notice => 'Загружаемый файл уже имеется на сервере.') }
      end
    end
  end

  # PUT /supplier_prices/1
  # PUT /supplier_prices/1.xml
  def update
    @attachment = SupplierPrice.find(params[:id])

    respond_to do |format|
      if @attachment.update_attributes(params[:attachment])
        format.html { redirect_to(@attachment, :notice => 'SupplierPrice was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attachment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /supplier_prices/1
  # DELETE /supplier_prices/1.xml
  def destroy
    @attachment = SupplierPrice.find(params[:id])
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to(supplier_prices_url) }
      format.xml  { head :ok }
    end
  end
end
