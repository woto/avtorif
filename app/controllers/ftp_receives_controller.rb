class FtpReceivesController < ApplicationController
  # GET /ftp_receives
  # GET /ftp_receives.xml
  def index
    @receive_ftps = FtpReceive.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @receive_ftps }
    end
  end

  # GET /ftp_receives/1
  # GET /ftp_receives/1.xml
  def show
    @receive_ftp = FtpReceive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @receive_ftp }
    end
  end

  # GET /ftp_receives/new
  # GET /ftp_receives/new.xml
  def new
    @receive_ftp = FtpReceive.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @receive_ftp }
    end
  end

  # GET /ftp_receives/1/edit
  def edit
    @receive_ftp = FtpReceive.find(params[:id])
  end

  # POST /ftp_receives
  # POST /ftp_receives.xml
  def create
    @receive_ftp = FtpReceive.new(params[:receive_ftp])

    respond_to do |format|
      if @receive_ftp.save
        format.html { redirect_to(@receive_ftp, :notice => 'FtpReceive was successfully created.') }
        format.xml  { render :xml => @receive_ftp, :status => :created, :location => @receive_ftp }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @receive_ftp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ftp_receives/1
  # PUT /ftp_receives/1.xml
  def update
    @receive_ftp = FtpReceive.find(params[:id])

    respond_to do |format|
      if @receive_ftp.update_attributes(params[:receive_ftp])
        format.html { redirect_to(@receive_ftp, :notice => 'FtpReceive was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @receive_ftp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ftp_receives/1
  # DELETE /ftp_receives/1.xml
  def destroy
    @receive_ftp = FtpReceive.find(params[:id])
    @receive_ftp.destroy

    respond_to do |format|
      format.html { redirect_to(receive_ftps_url) }
      format.xml  { head :ok }
    end
  end
end
