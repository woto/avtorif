class JobsController < ApplicationController
  # GET /jobs
  # GET /jobs.xml
  def index
    scope = Job
    scope = scope.scoped :conditions => "job_id IS NULL"
    scope = scope.scoped :conditions => {:supplier_id => params['supplier_id']} if params['supplier_id']
    @jobs = scope.paginate :include => :supplier,
                         :page => params[:page],
                         :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jobs }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.xml
  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.xml
  def new
    @job = Job.new
    @job.job_id = params[:job_id]
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.xml
  def create
    @job = Job.new(params[:job])
    @job.supplier_id = params[:supplier_id]
    #supplier = @job.supplier

    respond_to do |format|
      if @job.save
        format.html { redirect_to(params[:job][:job_id].present? ? supplier_job_path(params[:supplier_id], params[:job][:job_id]) : supplier_jobs_url(params[:supplier_id]), :notice => 'Job was successfully created.') }
        format.xml  { render :xml => @job, :status => :created, :location => @job }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.xml
  def update
    @job = Job.find(params[:id])
    #@job.last_finish = nil
    @job.started_once = false
    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to(@job.parent.present? ? supplier_job_path(params[:supplier_id], @job.parent.id) : supplier_jobs_path(params[:supplier_id]), :notice => 'Job was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.xml
  def destroy
    @job = Job.find(params[:id])
    parent = @job.parent
    @job.destroy

    respond_to do |format|
      format.html { redirect_to(parent.present? ? supplier_job_path(params[:supplier_id], parent.id) : supplier_jobs_path(params[:supplier_id])) }
      format.xml  { head :ok }
    end
  end

  def start
    @job = Job.find(:first, :conditions => {:active => '1', :id => params[:id]})
    if(@job.jobable_type == "ReceiveJob")
      JobWalker.new.start_job(@job, 50, :force => params[:force])
      flash[:notice] = "Задача поставщика успешно поставлена в очередь"
    else
      group_code = SupplierPrice.where("job_id = #{@job.job_id}").order("id desc").limit(1).first.group_code
      optional = SupplierPrice.where("job_id = #{@job.job_id}").where("group_code = '#{group_code}'").all.map(&:id)
      JobWalker.new.start_job(@job, 50, optional)
      flash[:notice] = "Задача поставщика успешно поставлена в очередь"
    end
    
    respond_to do |format|
      format.html { redirect_to(@job.parent.present? ? supplier_job_path(params[:supplier_id], @job.parent.id) : supplier_jobs_path(params[:supplier_id])) }
      format.js { render :text => "Заглушка" }
    end
  end

  def start_all
    jobs = Job.all(:conditions => "jobable_type = 'ReceiveJob' AND active = 1 AND next_start IS NOT NULL AND active = 1")
    jobs.each do |job|
      JobWalker.new.start_job(job, 75, :force=>true)
    end

    respond_to do |format|
      format.html { redirect_to(suppliers_path) }
      format.js { render :text => "Заглушка" }
    end
  end
  
  def display_jobs
    @jobs = Job.where(:jobable_type => params[:job_type] || "ImportJob").includes(:supplier).paginate(:page => params[:page])
        #sql = "SELECT * FROM prices_#{@job.id limit 10"
    #ActiveRecord::Base.connection.execute(sql)
    respond_to do |format|
      format.html { render :action => :index} # index.html.erb
      format.xml  { render :xml => @jobs }
    end
  end

  def start_by_supplier
    jobs = Job.all(:conditions => ["jobable_type = 'ReceiveJob' AND next_start IS NOT NULL AND active = 1 AND supplier_id = ?", params[:supplier_id]])
    if(jobs.size)
      flash[:notice] = "Задачи поставщика успешно поставлены в очередь"
    end
    jobs.each do |job|
      JobWalker.new.start_job(job, 50, :force=>true)
    end

    respond_to do |format|
      format.html { redirect_to(suppliers_path) }
      format.js { render :text => "Заглушка" }
    end
  end

  def clean
     query = "TRUNCATE price_import_#{params[:id]}"
     ActiveRecord::Base.connection.execute(query)

     CommonModule::all_doublets do |l|
       query = "DELETE FROM price_cost_#{l} WHERE job_id = #{params[:id]}"
       ActiveRecord::Base.connection.execute(query)
     end
    
     redirect_to(supplier_job_path(params[:supplier_id], params[:id]))
  end

end
