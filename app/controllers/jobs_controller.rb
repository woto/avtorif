class JobsController < ApplicationController
  # GET /jobs
  # GET /jobs.xml
  def index
    scope = Job
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
    @job.file_mask = '\".*\"'
    
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
        format.html { redirect_to(supplier_jobs_url(params[:supplier_id]), :notice => 'Job was successfully created.') }
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

    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to(@job, :notice => 'Job was successfully updated.') }
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
    supplier = @job.supplier
    @job.destroy

    respond_to do |format|
      format.html { redirect_to(supplier_jobs_url(supplier)) }
      format.xml  { head :ok }
    end
  end

  def start
    @job = Job.find(params[:id])
    JobWalker.new.start_job(@job)
    redirect_to(supplier_jobs[@job.supplier.id])
  end
  
end
