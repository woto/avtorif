class ImportXlsController < ApplicationController
  # GET /import_xls
  # GET /import_xls.xml
  def index
    @import_xls = ImportXl.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @import_xls }
    end
  end

  # GET /import_xls/1
  # GET /import_xls/1.xml
  def show
    @import_xl = ImportXl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @import_xl }
    end
  end

  # GET /import_xls/new
  # GET /import_xls/new.xml
  def new
    @import_xl = ImportXl.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @import_xl }
    end
  end

  # GET /import_xls/1/edit
  def edit
    @import_xl = ImportXl.find(params[:id])
  end

  # POST /import_xls
  # POST /import_xls.xml
  def create
    @import_xl = ImportXl.new(params[:import_xl])

    respond_to do |format|
      if @import_xl.save
        format.html { redirect_to(@import_xl, :notice => 'ImportXl was successfully created.') }
        format.xml  { render :xml => @import_xl, :status => :created, :location => @import_xl }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @import_xl.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /import_xls/1
  # PUT /import_xls/1.xml
  def update
    @import_xl = ImportXl.find(params[:id])

    respond_to do |format|
      if @import_xl.update_attributes(params[:import_xl])
        format.html { redirect_to(@import_xl, :notice => 'ImportXl was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @import_xl.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /import_xls/1
  # DELETE /import_xls/1.xml
  def destroy
    @import_xl = ImportXl.find(params[:id])
    @import_xl.destroy

    respond_to do |format|
      format.html { redirect_to(import_xls_url) }
      format.xml  { head :ok }
    end
  end
end
