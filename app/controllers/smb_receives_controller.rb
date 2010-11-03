class SmbReceivesController < ApplicationController
  # GET /smb_receives
  # GET /smb_receives.xml
  def index
    @smb_receives = SmbReceive.all(:joins => [:receive_job])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @smb_receives }
    end
  end

  # GET /smb_receives/1
  # GET /smb_receives/1.xml
  def show
    @smb_receive = SmbReceive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @smb_receive }
    end
  end

  # GET /smb_receives/new
  # GET /smb_receives/new.xml
  def new
    @smb_receive = SmbReceive.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @smb_receive }
    end
  end

  # GET /smb_receives/1/edit
  def edit
    @smb_receive = SmbReceive.find(params[:id])
  end

  # POST /smb_receives
  # POST /smb_receives.xml
  def create
    @smb_receive = SmbReceive.new(params[:smb_receive])
    receive_job = ReceiveJob.create(:receiveable => @smb_receive)
    Job.update(params[:job_id], :jobable => receive_job)    

    respond_to do |format|
      if @smb_receive.save
        format.html { redirect_to(supplier_jobs_path(params[:supplier_id]), :notice => 'SmbReceive was successfully created.') }
        format.xml  { render :xml => @smb_receive, :status => :created, :location => @smb_receive }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @smb_receive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /smb_receives/1
  # PUT /smb_receives/1.xml
  def update
    @smb_receive = SmbReceive.find(params[:id])

    respond_to do |format|
      if @smb_receive.update_attributes(params[:smb_receive])
        format.html { redirect_to(@smb_receive, :notice => 'SmbReceive was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @smb_receive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /smb_receives/1
  # DELETE /smb_receives/1.xml
  def destroy
    @smb_receive = SmbReceive.find(params[:id])
    @smb_receive.destroy

    respond_to do |format|
      format.html { redirect_to(smb_receives_url) }
      format.xml  { head :ok }
    end
  end
end
