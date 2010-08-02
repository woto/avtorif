class ExcelsController < ApplicationController
  # GET /excels
  # GET /excels.xml
  def index
    @excels = Excel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @excels }
    end
  end

  # GET /excels/1
  # GET /excels/1.xml
  def show
    @excel = Excel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @excel }
    end
  end

  # GET /excels/new
  # GET /excels/new.xml
  def new
    @excel = Excel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @excel }
    end
  end

  # GET /excels/1/edit
  def edit
    @excel = Excel.find(params[:id])
  end

  # POST /excels
  # POST /excels.xml
  def create
    @excel = Excel.new(params[:excel])

    respond_to do |format|
      if @excel.save
        format.html { redirect_to(@excel, :notice => 'Excel was successfully created.') }
        format.xml  { render :xml => @excel, :status => :created, :location => @excel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @excel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /excels/1
  # PUT /excels/1.xml
  def update
    @excel = Excel.find(params[:id])

    respond_to do |format|
      if @excel.update_attributes(params[:excel])
        format.html { redirect_to(@excel, :notice => 'Excel was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @excel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /excels/1
  # DELETE /excels/1.xml
  def destroy
    @excel = Excel.find(params[:id])
    @excel.destroy

    respond_to do |format|
      format.html { redirect_to(excels_url) }
      format.xml  { head :ok }
    end
  end
end
