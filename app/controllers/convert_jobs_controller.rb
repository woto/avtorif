class ConvertJobsController < ApplicationController
  # GET /convert_jobs
  # GET /convert_jobs.xml
  def index
    @convert_jobs = ConvertJob.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @convert_jobs }
    end
  end

  # GET /convert_jobs/1
  # GET /convert_jobs/1.xml
  def show
    @convert_job = ConvertJob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @convert_job }
    end
  end

  # GET /convert_jobs/new
  # GET /convert_jobs/new.xml
  def new
    @convert_job = ConvertJob.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @convert_job }
    end
  end

  # GET /convert_jobs/1/edit
  def edit
    @convert_job = ConvertJob.find(params[:id])
  end

  # POST /convert_jobs
  # POST /convert_jobs.xml
  def create
    @convert_job = ConvertJob.new(params[:convert_job])
    job = Job.find(params[:job_id])
    job.jobable = @convert_job
    job.save

    respond_to do |format|
      if @convert_job.save
        format.html { redirect_to(@convert_job, :notice => 'ConvertJob was successfully created.') }
        format.xml  { render :xml => @convert_job, :status => :created, :location => @convert_job }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @convert_job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /convert_jobs/1
  # PUT /convert_jobs/1.xml
  def update
    @convert_job = ConvertJob.find(params[:id])

    respond_to do |format|
      if @convert_job.update_attributes(params[:convert_job])
        format.html { redirect_to(@convert_job, :notice => 'ConvertJob was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @convert_job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /convert_jobs/1
  # DELETE /convert_jobs/1.xml
  def destroy
    @convert_job = ConvertJob.find(params[:id])
    @convert_job.destroy

    respond_to do |format|
      format.html { redirect_to(convert_jobs_url) }
      format.xml  { head :ok }
    end
  end
end
