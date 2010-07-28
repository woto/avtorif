class FtpSettingsController < ApplicationController
  # GET /ftp_settings
  # GET /ftp_settings.xml
  def index
    @ftp_settings = FtpSetting.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ftp_settings }
    end
  end

  # GET /ftp_settings/1
  # GET /ftp_settings/1.xml
  def show
    @ftp_setting = FtpSetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ftp_setting }
    end
  end

  # GET /ftp_settings/new
  # GET /ftp_settings/new.xml
  def new
    @ftp_setting = FtpSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ftp_setting }
    end
  end

  # GET /ftp_settings/1/edit
  def edit
    @ftp_setting = FtpSetting.find(params[:id])
  end

  # POST /ftp_settings
  # POST /ftp_settings.xml
  def create
    @ftp_setting = FtpSetting.new(params[:ftp_setting])

    respond_to do |format|
      if @ftp_setting.save
        format.html { redirect_to(@ftp_setting, :notice => 'FtpSetting was successfully created.') }
        format.xml  { render :xml => @ftp_setting, :status => :created, :location => @ftp_setting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ftp_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ftp_settings/1
  # PUT /ftp_settings/1.xml
  def update
    @ftp_setting = FtpSetting.find(params[:id])

    respond_to do |format|
      if @ftp_setting.update_attributes(params[:ftp_setting])
        format.html { redirect_to(@ftp_setting, :notice => 'FtpSetting was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ftp_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ftp_settings/1
  # DELETE /ftp_settings/1.xml
  def destroy
    @ftp_setting = FtpSetting.find(params[:id])
    @ftp_setting.destroy

    respond_to do |format|
      format.html { redirect_to(ftp_settings_url) }
      format.xml  { head :ok }
    end
  end
end
