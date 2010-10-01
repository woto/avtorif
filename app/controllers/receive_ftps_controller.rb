class ReceiveFtpsController < ApplicationController
  # GET /receive_ftps
  # GET /receive_ftps.xml
  def index
    @receive_ftps = FtpReceive.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @receive_ftps }
    end
  end

  # GET /receive_ftps/1
  # GET /receive_ftps/1.xml
  def show
    @receive_ftp = FtpReceive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @receive_ftp }
    end
  end

  # GET /receive_ftps/new
  # GET /receive_ftps/new.xml
  def new
    @receive_ftp = FtpReceive.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @receive_ftp }
    end
  end

  # GET /receive_ftps/1/edit
  def edit
    @receive_ftp = FtpReceive.find(params[:id])
  end

  # POST /receive_ftps
  # POST /receive_ftps.xml
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

  # PUT /receive_ftps/1
  # PUT /receive_ftps/1.xml
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

  # DELETE /receive_ftps/1
  # DELETE /receive_ftps/1.xml
  def destroy
    @receive_ftp = FtpReceive.find(params[:id])
    @receive_ftp.destroy

    respond_to do |format|
      format.html { redirect_to(receive_ftps_url) }
      format.xml  { head :ok }
    end
  end
end
