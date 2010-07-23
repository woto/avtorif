class ContractorsController < ApplicationController
  # GET /contractors
  # GET /contractors.xml
  def index
    @contractors = Contractor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contractors }
    end
  end

  # GET /contractors/1
  # GET /contractors/1.xml
  def show
    @contractor = Contractor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contractor }
    end
  end

  # GET /contractors/new
  # GET /contractors/new.xml
  def new
    @contractor = Contractor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contractor }
    end
  end

  # GET /contractors/1/edit
  def edit
    @contractor = Contractor.find(params[:id])
  end

  # POST /contractors
  # POST /contractors.xml
  def create
    @contractor = Contractor.new(params[:contractor])

    respond_to do |format|
      if @contractor.save
        format.html { redirect_to(@contractor, :notice => 'Contractor was successfully created.') }
        format.xml  { render :xml => @contractor, :status => :created, :location => @contractor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contractor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contractors/1
  # PUT /contractors/1.xml
  def update
    @contractor = Contractor.find(params[:id])

    respond_to do |format|
      if @contractor.update_attributes(params[:contractor])
        format.html { redirect_to(@contractor, :notice => 'Contractor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contractor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contractors/1
  # DELETE /contractors/1.xml
  def destroy
    @contractor = Contractor.find(params[:id])
    @contractor.destroy

    respond_to do |format|
      format.html { redirect_to(contractors_url) }
      format.xml  { head :ok }
    end
  end
end
