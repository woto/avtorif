class CsvsController < ApplicationController
  # GET /csvs
  # GET /csvs.xml
  def index
    @csvs = Csv.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @csvs }
    end
  end

  # GET /csvs/1
  # GET /csvs/1.xml
  def show
    @csv = Csv.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @csv }
    end
  end

  # GET /csvs/new
  # GET /csvs/new.xml
  def new
    @csv = Csv.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @csv }
    end
  end

  # GET /csvs/1/edit
  def edit
    @csv = Csv.find(params[:id])
  end

  # POST /csvs
  # POST /csvs.xml
  def create
    @csv = Csv.new(params[:csv])

    respond_to do |format|
      if @csv.save
        format.html { redirect_to(@csv, :notice => 'Csv was successfully created.') }
        format.xml  { render :xml => @csv, :status => :created, :location => @csv }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @csv.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /csvs/1
  # PUT /csvs/1.xml
  def update
    @csv = Csv.find(params[:id])

    respond_to do |format|
      if @csv.update_attributes(params[:csv])
        format.html { redirect_to(@csv, :notice => 'Csv was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @csv.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /csvs/1
  # DELETE /csvs/1.xml
  def destroy
    @csv = Csv.find(params[:id])
    @csv.destroy

    respond_to do |format|
      format.html { redirect_to(csvs_url) }
      format.xml  { head :ok }
    end
  end
end
