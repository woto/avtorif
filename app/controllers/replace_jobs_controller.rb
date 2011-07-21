class ReplaceJobsController < ApplicationController
  # GET /replace_jobs
  # GET /replace_jobs.xml
  def index
    @replace_jobs = ReplaceJob.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @replace_jobs }
    end
  end

  # GET /replace_jobs/1
  # GET /replace_jobs/1.xml
  def show
    @replace_job = ReplaceJob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @replace_job }
    end
  end

  # GET /replace_jobs/new
  # GET /replace_jobs/new.xml
  def new
    @replace_job = ReplaceJob.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @replace_job }
    end
  end

  # GET /replace_jobs/1/edit
  def edit
    @replace_job = ReplaceJob.find(params[:id])
  end

  # POST /replace_jobs
  # POST /replace_jobs.xml
  def create
    @replace_job = ReplaceJob.new(params[:replace_job])
    job = Job.find(params[:job_id])
    job.jobable = @replace_job
    job.save

    parent = job.parent

    respond_to do |format|
      if @replace_job.save
        format.html { redirect_to(parent.present? ? supplier_job_path(params[:supplier_id], parent.id) : supplier_jobs_path(params[:supplier_id]), :notice => 'Задача загрузки замен успешно создана') }
        format.xml  { render :xml => @replace_job, :status => :created, :location => @replace_job }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @replace_job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /replace_jobs/1
  # PUT /replace_jobs/1.xml
  def update
    @replace_job = ReplaceJob.find(params[:id])
    job = @replace_job.jobs.first
    parent = job.parent

    respond_to do |format|
      if @replace_job.update_attributes(params[:replace_job])
        format.html { redirect_to(parent.present? ? supplier_job_path(params[:supplier_id], parent.id) : supplier_jobs_path(params[:supplier_id]), :notice => 'Задача загрузки замен обновлена') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @replace_job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /replace_jobs/1
  # DELETE /replace_jobs/1.xml
  def destroy
    @replace_job = ReplaceJob.find(params[:id])
    @replace_job.destroy

    respond_to do |format|
      format.html { redirect_to(replace_jobs_url) }
      format.xml  { head :ok }
    end
  end
end
