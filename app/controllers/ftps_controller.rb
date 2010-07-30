class FtpsController < ApplicationController
  # GET /ftps
  # GET /ftps.xml
  def index
    @ftps = Ftp.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ftps }
    end
  end

  # GET /ftps/1
  # GET /ftps/1.xml
  def show
    @ftp = Ftp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ftp }
    end
  end

  # GET /ftps/new
  # GET /ftps/new.xml
  def new
    @ftp = Ftp.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ftp }
    end
  end

  # GET /ftps/1/edit
  def edit
    @ftp = Ftp.find(params[:id])
  end

  # POST /ftps
  # POST /ftps.xml
  def create
    @ftp = Ftp.new(params[:ftp])

    respond_to do |format|
      if @ftp.save
        format.html { redirect_to(@ftp, :notice => 'Ftp was successfully created.') }
        format.xml  { render :xml => @ftp, :status => :created, :location => @ftp }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ftp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ftps/1
  # PUT /ftps/1.xml
  def update
    @ftp = Ftp.find(params[:id])

    respond_to do |format|
      if @ftp.update_attributes(params[:ftp])
        format.html { redirect_to(@ftp, :notice => 'Ftp was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ftp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ftps/1
  # DELETE /ftps/1.xml
  def destroy
    @ftp = Ftp.find(params[:id])
    @ftp.destroy

    respond_to do |format|
      format.html { redirect_to(ftps_url) }
      format.xml  { head :ok }
    end
  end
end
