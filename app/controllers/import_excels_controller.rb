class ImportExcelsController < ApplicationController
  # GET /import_excels
  # GET /import_excels.xml
  def index
    @import_excels = ImportExcel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @import_excels }
    end
  end

  # GET /import_excels/1
  # GET /import_excels/1.xml
  def show
    @import_excel = ImportExcel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @import_excel }
    end
  end

  # GET /import_excels/new
  # GET /import_excels/new.xml
  def new
    @import_excel = ImportExcel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @import_excel }
    end
  end

  # GET /import_excels/1/edit
  def edit
    @import_excel = ImportExcel.find(params[:id])
  end

  # POST /import_excels
  # POST /import_excels.xml
  def create
    @import_excel = ImportExcel.new(params[:import_excel])

    respond_to do |format|
      if @import_excel.save
        format.html { redirect_to(@import_excel, :notice => 'ImportExcel was successfully created.') }
        format.xml  { render :xml => @import_excel, :status => :created, :location => @import_excel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @import_excel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /import_excels/1
  # PUT /import_excels/1.xml
  def update
    @import_excel = ImportExcel.find(params[:id])

    respond_to do |format|
      if @import_excel.update_attributes(params[:import_excel])
        format.html { redirect_to(@import_excel, :notice => 'ImportExcel was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @import_excel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /import_excels/1
  # DELETE /import_excels/1.xml
  def destroy
    @import_excel = ImportExcel.find(params[:id])
    @import_excel.destroy

    respond_to do |format|
      format.html { redirect_to(import_excels_url) }
      format.xml  { head :ok }
    end
  end
end
