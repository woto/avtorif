class FolderSettingsController < ApplicationController
  # GET /folder_settings
  # GET /folder_settings.xml
  def index
    @folder_settings = FolderReceiveSetting.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @folder_settings }
    end
  end

  # GET /folder_settings/1
  # GET /folder_settings/1.xml
  def show
    @folder_setting = FolderReceiveSetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @folder_setting }
    end
  end

  # GET /folder_settings/new
  # GET /folder_settings/new.xml
  def new
    @folder_setting = FolderReceiveSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @folder_setting }
    end
  end

  # GET /folder_settings/1/edit
  def edit
    @folder_setting = FolderReceiveSetting.find(params[:id])
  end

  # POST /folder_settings
  # POST /folder_settings.xml
  def create
    @folder_setting = FolderReceiveSetting.new(params[:folder_setting])

    respond_to do |format|
      if @folder_setting.save
        format.html { redirect_to(@folder_setting, :notice => 'FolderReceiveSetting was successfully created.') }
        format.xml  { render :xml => @folder_setting, :status => :created, :location => @folder_setting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @folder_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /folder_settings/1
  # PUT /folder_settings/1.xml
  def update
    @folder_setting = FolderReceiveSetting.find(params[:id])

    respond_to do |format|
      if @folder_setting.update_attributes(params[:folder_setting])
        format.html { redirect_to(@folder_setting, :notice => 'FolderReceiveSetting was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @folder_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /folder_settings/1
  # DELETE /folder_settings/1.xml
  def destroy
    @folder_setting = FolderReceiveSetting.find(params[:id])
    @folder_setting.destroy

    respond_to do |format|
      format.html { redirect_to(folder_settings_url) }
      format.xml  { head :ok }
    end
  end
end
