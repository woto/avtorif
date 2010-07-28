class RepeatsJobsController < ApplicationController
  # GET /repeats_jobs
  # GET /repeats_jobs.xml
  def index
    @repeats_jobs = RepeatsJob.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @repeats_jobs }
    end
  end

  # GET /repeats_jobs/1
  # GET /repeats_jobs/1.xml
  def show
    @repeats_job = RepeatsJob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @repeats_job }
    end
  end

  # GET /repeats_jobs/new
  # GET /repeats_jobs/new.xml
  def new
    @repeats_job = RepeatsJob.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @repeats_job }
    end
  end

  # GET /repeats_jobs/1/edit
  def edit
    @repeats_job = RepeatsJob.find(params[:id])
  end

  # POST /repeats_jobs
  # POST /repeats_jobs.xml
  def create
    @repeats_job = RepeatsJob.new(params[:repeats_job])

    respond_to do |format|
      if @repeats_job.save
        format.html { redirect_to(@repeats_job, :notice => 'RepeatsJob was successfully created.') }
        format.xml  { render :xml => @repeats_job, :status => :created, :location => @repeats_job }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @repeats_job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /repeats_jobs/1
  # PUT /repeats_jobs/1.xml
  def update
    @repeats_job = RepeatsJob.find(params[:id])

    respond_to do |format|
      if @repeats_job.update_attributes(params[:repeats_job])
        format.html { redirect_to(@repeats_job, :notice => 'RepeatsJob was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @repeats_job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /repeats_jobs/1
  # DELETE /repeats_jobs/1.xml
  def destroy
    @repeats_job = RepeatsJob.find(params[:id])
    @repeats_job.destroy

    respond_to do |format|
      format.html { redirect_to(repeats_jobs_url) }
      format.xml  { head :ok }
    end
  end
end
