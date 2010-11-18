class SupplierPricesController < ApplicationController
  # GET /supplier_prices
  # GET /supplier_prices.xml
  def index
    @attachments = SupplierPrice.paginate(:page => params[:page], :order => "id DESC")

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

    begin
      md5 = Digest::MD5.file(params[:supplier_price][:attachment].path).hexdigest
    rescue
      redirect_to(supplier_job_path(params[:supplier_id], params[:job_id]), :notice => 'Вы не выбрали файл')
      return
    end

    job = Job.find(params[:job_id])
    
    unless params[:supplier_price][:attachment].original_filename =~ Regexp.new(eval(job.file_mask))
      redirect_to(supplier_job_path(params[:supplier_id], params[:job_id]), :notice => 'Имя файла не подходит под регулярное выражение задачи')
      return
    end

    wc_stat = `wc #{params[:supplier_price][:attachment].path.to_s.shellescape}`

    #@attachment = SupplierPrice.new(params[:attachment])
    #@attachment.md5 = Digest::MD5.hexdigest(File.read())

    if params[:force] || SupplierPrice.find(:first, :conditions => ['md5 = ? AND supplier_id = ?',  md5, params[:supplier_id]]).nil?

      respond_to do |format|
        group_code = 'r' + Time.now.to_s
        @attachment = SupplierPrice.new(params[:supplier_price])
        @attachment.md5 = md5
        @attachment.group_code = group_code
        @attachment.wc_stat = wc_stat
        @attachment.supplier = job.supplier
        @attachment.job = job

        if @attachment.save

          job_childs = job.childs.active

          job.last_start = Time.zone.now
          job.last_finish = Time.zone.now
          job.started_once = true
          job.save
          
          job_childs.each do |job_child|
            jobber_class = (job_child.jobable.class.to_s.split(/(.*?)Job/)[1] + "Jobable").classify.constantize

            #jobber = jobber_class.new(concrete_job)
            #Delayed::Job.enqueue ReceiveJobber.new(ImportJob.first)

            #Delayed::Job.enqueue jobber_class.new(job_child, job_child.jobable, @attachment.id)
            JobWalker.new.start_job(job_child, @attachment.id)            


            #ijs = ImportJob.find(:all, :conditions => {:job => {:supplier_id => params[:attachment][:supplier_id]}}, :joins => "INNER JOIN import_jobs ij ON ij.id = jobs.jobable_id ")
            #ijs = ImportJob.find(:all, :conditions => {:jobs => {:supplier_id => params[:attachment][:supplier_id]}}, :joins => "INNER JOIN jobs ON import_jobs.id = jobs.jobable_id ")
            #ijs = ImportJob.find(:all, :conditions => {:jobs => {:supplier_id => params[:attachment][:supplier_id]}}, :joins => :job)
            #ijs = ijs.select{|ij| ij.job.file_mask.match(params[:attachment][:attachment].original_filename)}
          end

          format.html { redirect_to(supplier_job_path(params[:supplier_id], params[:job_id]), :notice => 'SupplierPrice was successfully created.') }
          format.xml  { render :xml => @attachment, :status => :created, :location => @attachment }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @attachment.errors, :status => :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to(supplier_job_path(params[:supplier_id], params[:job_id]), :notice => 'Загружаемый файл уже имеется на сервере.') }
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
      format.html { redirect_to(supplier_job_path(params[:supplier_id], params[:job_id])) }
      format.xml  { head :ok }
    end
  end

  def destroy_by_supplier
    SupplierPrice.destroy_all(["supplier_id = ?", params[:supplier_id]])

    respond_to do |format|
      format.html { redirect_to(supplier_path(params[:supplier_id])) }
      format.xml  { head :ok }
    end    
  end
end
