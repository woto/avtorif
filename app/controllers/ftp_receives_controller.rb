class FtpReceivesController < ApplicationController
  # GET /ftp_receives
  # GET /ftp_receives.xml
  def index
    @ftp_receives = FtpReceive.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ftp_receives }
    end
  end

  # GET /ftp_receives/1
  # GET /ftp_receives/1.xml
  def show
    @ftp_receive = FtpReceive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ftp_receive }
    end
  end

  # GET /ftp_receives/new
  # GET /ftp_receives/new.xml
  def new
    @ftp_receive = FtpReceive.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ftp_receive }
    end
  end

  # GET /ftp_receives/1/edit
  def edit
    @ftp_receive = FtpReceive.find(params[:id])
  end

  # POST /ftp_receives
  # POST /ftp_receives.xml
  def create
    @ftp_receive = FtpReceive.new(params[:ftp_receive])
    receive_job = ReceiveJob.create(:receiveable => @ftp_receive)
    Job.update(params[:job_id], :jobable => receive_job)

    respond_to do |format|
      if @ftp_receive.save
        format.html { redirect_to(supplier_jobs_path(Job.find(params[:job_id]).supplier), :notice => 'FtpReceive was successfully created.') }
        format.xml  { render :xml => @ftp_receive, :status => :created, :location => @ftp_receive }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ftp_receive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ftp_receives/1
  # PUT /ftp_receives/1.xml
  def update
    @ftp_receive = FtpReceive.find(params[:id])

    respond_to do |format|
      if @ftp_receive.update_attributes(params[:ftp_receive])
        format.html { redirect_to(supplier_jobs_path(params[:supplier_id]), :notice => 'FtpReceive was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ftp_receive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ftp_receives/1
  # DELETE /ftp_receives/1.xml
  def destroy
    @ftp_receive = FtpReceive.find(params[:id])
    @ftp_receive.destroy

    respond_to do |format|
      format.html { redirect_to(ftp_receives_url) }
      format.xml  { head :ok }
    end
  end
end
