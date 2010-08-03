class ImportCsvsController < ApplicationController
  # GET /import_csvs
  # GET /import_csvs.xml
  def index
    @import_csvs = ImportCsv.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @import_csvs }
    end
  end

  # GET /import_csvs/1
  # GET /import_csvs/1.xml
  def show
    @import_csv = ImportCsv.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @import_csv }
    end
  end

  # GET /import_csvs/new
  # GET /import_csvs/new.xml
  def new
    @import_csv = ImportCsv.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @import_csv }
    end
  end

  # GET /import_csvs/1/edit
  def edit
    @import_csv = ImportCsv.find(params[:id])
  end

  # POST /import_csvs
  # POST /import_csvs.xml
  def create
    @import_csv = ImportCsv.new(params[:import_csv])

    respond_to do |format|
      if @import_csv.save
        format.html { redirect_to(@import_csv, :notice => 'ImportCsv was successfully created.') }
        format.xml  { render :xml => @import_csv, :status => :created, :location => @import_csv }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @import_csv.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /import_csvs/1
  # PUT /import_csvs/1.xml
  def update
    @import_csv = ImportCsv.find(params[:id])

    respond_to do |format|
      if @import_csv.update_attributes(params[:import_csv])
        format.html { redirect_to(@import_csv, :notice => 'ImportCsv was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @import_csv.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /import_csvs/1
  # DELETE /import_csvs/1.xml
  def destroy
    @import_csv = ImportCsv.find(params[:id])
    @import_csv.destroy

    respond_to do |format|
      format.html { redirect_to(import_csvs_url) }
      format.xml  { head :ok }
    end
  end
end
