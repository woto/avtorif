# encoding: utf-8

class FilterJobsController < ApplicationController
  # GET /filter_jobs
  # GET /filter_jobs.xml
  def index
    @filter_jobs = FilterJob.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @filter_jobs }
    end
  end

  # GET /filter_jobs/1
  # GET /filter_jobs/1.xml
  def show
    @filter_job = FilterJob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @filter_job }
    end
  end

  # GET /filter_jobs/new
  # GET /filter_jobs/new.xml
  def new
    @filter_job = FilterJob.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @filter_job }
    end
  end

  # GET /filter_jobs/1/edit
  def edit
    @filter_job = FilterJob.find(params[:id])
  end

  # POST /filter_jobs
  # POST /filter_jobs.xml
  def create
    @filter_job = FilterJob.new(params[:filter_job])

    job = Job.find(params[:job_id])
    job.jobable = @filter_job
    job.save
    parent = job.parent

    respond_to do |format|
      if @filter_job.save
        format.html { redirect_to(parent.present? ? supplier_job_path(params[:supplier_id], parent.id) : supplier_jobs_path(params[:supplier_id]), :notice => "Задача фильтрации успешно создана") }
        format.xml  { render :xml => @filter_job, :status => :created, :location => @filter_job }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @filter_job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /filter_jobs/1
  # PUT /filter_jobs/1.xml
  def update
    @filter_job = FilterJob.find(params[:id])
    job = @filter_job.jobs.first
    parent = job.parent

    respond_to do |format|
      if @filter_job.update_attributes(params[:filter_job])
        format.html { redirect_to(parent.present? ? supplier_job_path(params[:supplier_id], parent.id) : supplier_jobs_path(params[:supplier_id]), :notice => "Задача фильтрации успешно обновлена") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @filter_job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /filter_jobs/1
  # DELETE /filter_jobs/1.xml
  def destroy
    @filter_job = FilterJob.find(params[:id])
    @filter_job.destroy

    respond_to do |format|
      format.html { redirect_to(filter_jobs_url) }
      format.xml  { head :ok }
    end
  end
end
