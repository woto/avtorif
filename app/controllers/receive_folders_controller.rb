class ReceiveFoldersController < ApplicationController
  # GET /receive_folders
  # GET /receive_folders.xml
  def index
    @receive_folders = FolderReceive.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @receive_folders }
    end
  end

  # GET /receive_folders/1
  # GET /receive_folders/1.xml
  def show
    @receive_folder = FolderReceive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @receive_folder }
    end
  end

  # GET /receive_folders/new
  # GET /receive_folders/new.xml
  def new
    @receive_folder = FolderReceive.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @receive_folder }
    end
  end

  # GET /receive_folders/1/edit
  def edit
    @receive_folder = FolderReceive.find(params[:id])
  end

  # POST /receive_folders
  # POST /receive_folders.xml
  def create
    @receive_folder = FolderReceive.new(params[:receive_folder])

    respond_to do |format|
      if @receive_folder.save
        format.html { redirect_to(@receive_folder, :notice => 'FolderReceive was successfully created.') }
        format.xml  { render :xml => @receive_folder, :status => :created, :location => @receive_folder }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @receive_folder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /receive_folders/1
  # PUT /receive_folders/1.xml
  def update
    @receive_folder = FolderReceive.find(params[:id])

    respond_to do |format|
      if @receive_folder.update_attributes(params[:receive_folder])
        format.html { redirect_to(@receive_folder, :notice => 'FolderReceive was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @receive_folder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /receive_folders/1
  # DELETE /receive_folders/1.xml
  def destroy
    @receive_folder = FolderReceive.find(params[:id])
    @receive_folder.destroy

    respond_to do |format|
      format.html { redirect_to(receive_folders_url) }
      format.xml  { head :ok }
    end
  end
end
