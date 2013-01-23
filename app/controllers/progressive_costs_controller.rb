class ProgressiveCostsController < ApplicationController
  # GET /progressive_costs
  # GET /progressive_costs.xml
  def index
    @progressive_costs = ProgressiveCost.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @progressive_costs }
    end
  end

  # GET /progressive_costs/1
  # GET /progressive_costs/1.xml
  def show
    @progressive_cost = ProgressiveCost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @progressive_cost }
    end
  end

  # GET /progressive_costs/new
  # GET /progressive_costs/new.xml
  def new
    @progressive_cost = ProgressiveCost.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @progressive_cost }
    end
  end

  # GET /progressive_costs/1/edit
  def edit
    @progressive_cost = ProgressiveCost.find(params[:id])
  end

  # POST /progressive_costs
  # POST /progressive_costs.xml
  def create
    @progressive_cost = ProgressiveCost.new(params[:progressive_cost])

    respond_to do |format|
      if @progressive_cost.save
        format.html { redirect_to(@progressive_cost, :notice => 'Progressive cost was successfully created.') }
        format.xml  { render :xml => @progressive_cost, :status => :created, :location => @progressive_cost }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @progressive_cost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /progressive_costs/1
  # PUT /progressive_costs/1.xml
  def update
    @progressive_cost = ProgressiveCost.find(params[:id])

    respond_to do |format|
      if @progressive_cost.update_attributes(params[:progressive_cost])
        format.html { redirect_to(@progressive_cost, :notice => 'Progressive cost was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @progressive_cost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /progressive_costs/1
  # DELETE /progressive_costs/1.xml
  def destroy
    @progressive_cost = ProgressiveCost.find(params[:id])
    @progressive_cost.destroy

    respond_to do |format|
      format.html { redirect_to(progressive_costs_url) }
      format.xml  { head :ok }
    end
  end
end
