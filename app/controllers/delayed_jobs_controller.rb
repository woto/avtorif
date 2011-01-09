class DelayedJobsController < ApplicationController
  def index
    @delayed_jobs = DelayedJob.joins({:job => :supplier}).order(["locked_by DESC", :priority, :run_at]).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :action => :index} # index.html.erb
      format.xml  { render :xml => @jobs }
    end
  end

  def destroy
    @delayed_job = DelayedJob.find(params[:id])
    @delayed_job.destroy

    respond_to do |format|
      format.html { redirect_to(delayed_jobs_path) }
      format.xml  { head :ok }
    end
  end

  def edit
    @delayed_job = DelayedJob.find(params[:id])
  end

  def update
    @delayed_job = DelayedJob.find(params[:id])

    respond_to do |format|
      if @delayed_job.update_attributes(params[:delayed_job])
        format.html { redirect_to(delayed_jobs_path, :notice => 'Delayed Job was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @delayed_job.errors, :status => :unprocessable_entity }
      end
    end
  end

end
