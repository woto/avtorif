class ImportJobsController < ApplicationController
  # GET /import_jobs
  # GET /import_jobs.xml
  def index
    @import_jobs = ImportJob.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @import_jobs }
    end
  end

  # GET /import_jobs/1
  # GET /import_jobs/1.xml
  def show
    @import_job = ImportJob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @import_job }
    end
  end

  # GET /import_jobs/new
  # GET /import_jobs/new.xml
  def new
    @import_job = ImportJob.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @import_job }
    end
  end

  # GET /import_jobs/1/edit
  def edit
    @import_job = ImportJob.find(params[:id])
  end

  # POST /import_jobs
  # POST /import_jobs.xml
  def create
    @import_job = ImportJob.new(params[:import_job])

    job = Job.find(params[:job_id])
    job.jobable = @import_job
    job.save


    respond_to do |format|
      if @import_job.save
        format.html { redirect_to(supplier_jobs_path(params[:supplier_id]), :notice => 'ImportJob was successfully created.') }
        format.xml  { render :xml => @import_job, :status => :created, :location => @import_job }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @import_job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /import_jobs/1
  # PUT /import_jobs/1.xml
  def update
    @import_job = ImportJob.find(params[:id])

    respond_to do |format|
      if @import_job.update_attributes(params[:import_job])
        format.html { redirect_to(supplier_jobs_path(params[:supplier_id]), :notice => 'ImportJob was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @import_job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /import_jobs/1
  # DELETE /import_jobs/1.xml
  def destroy
    @import_job = ImportJob.find(params[:id])
    @import_job.destroy

    respond_to do |format|
      format.html { redirect_to(import_jobs_url) }
      format.xml  { head :ok }
    end
  end
end
