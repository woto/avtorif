class UnpackJobsController < ApplicationController
  # GET /unpack_jobs
  # GET /unpack_jobs.xml
  def index
    @unpack_jobs = UnpackJob.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @unpack_jobs }
    end
  end

  # GET /unpack_jobs/1
  # GET /unpack_jobs/1.xml
  def show
    @unpack_job = UnpackJob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @unpack_job }
    end
  end

  # GET /unpack_jobs/new
  # GET /unpack_jobs/new.xml
  def new
    @unpack_job = UnpackJob.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @unpack_job }
    end
  end

  # GET /unpack_jobs/1/edit
  def edit
    @unpack_job = UnpackJob.find(params[:id])
  end

  # POST /unpack_jobs
  # POST /unpack_jobs.xml
  def create
    @unpack_job = UnpackJob.new(params[:unpack_job])

    job = Job.find(params[:job_id])
    job.jobable = @unpack_job
    job.save

    parent = job.parent

    respond_to do |format|
      if @unpack_job.save
        format.html { redirect_to(parent.present? ? supplier_job_path(params[:supplier_id], parent.id) : supplier_jobs_path(params[:supplier_id]), :notice => 'Задача распаковки успешно создана') }

        #format.html { redirect_to(supplier_jobs_path(job.supplier), :notice => 'UnpackJob was successfully created.') }
        format.xml  { render :xml => @unpack_job, :status => :created, :location => @unpack_job }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @unpack_job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /unpack_jobs/1
  # PUT /unpack_jobs/1.xml
  def update
    @unpack_job = UnpackJob.find(params[:id])
    job = @unpack_job.jobs.first 
    parent = job.parent 

    respond_to do |format|
      if @unpack_job.update_attributes(params[:unpack_job])
        format.html { redirect_to(parent.present? ? supplier_job_path(params[:supplier_id], parent.id) : supplier_jobs_path(params[:supplier_id]), :notice => 'Задача конвертирования успешно обновлена') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @unpack_job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /unpack_jobs/1
  # DELETE /unpack_jobs/1.xml
  def destroy
    @unpack_job = UnpackJob.find(params[:id])
    @unpack_job.destroy

    respond_to do |format|
      format.html { redirect_to(unpack_jobs_url) }
      format.xml  { head :ok }
    end
  end
end
