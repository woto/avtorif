class FuelsController < ApplicationController
  # GET /fuels
  # GET /fuels.xml
  def index
    @fuels = Fuel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fuels }
    end
  end

  # GET /fuels/1
  # GET /fuels/1.xml
  def show
    @fuel = Fuel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fuel }
    end
  end

  # GET /fuels/new
  # GET /fuels/new.xml
  def new
    @fuel = Fuel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fuel }
    end
  end

  # GET /fuels/1/edit
  def edit
    @fuel = Fuel.find(params[:id])
  end

  # POST /fuels
  # POST /fuels.xml
  def create
    @fuel = Fuel.new(params[:fuel])

    respond_to do |format|
      if @fuel.save
        format.html { redirect_to(@fuel, :notice => 'Fuel was successfully created.') }
        format.xml  { render :xml => @fuel, :status => :created, :location => @fuel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fuel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fuels/1
  # PUT /fuels/1.xml
  def update
    @fuel = Fuel.find(params[:id])

    respond_to do |format|
      if @fuel.update_attributes(params[:fuel])
        format.html { redirect_to(@fuel, :notice => 'Fuel was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fuel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fuels/1
  # DELETE /fuels/1.xml
  def destroy
    @fuel = Fuel.find(params[:id])
    @fuel.destroy

    respond_to do |format|
      format.html { redirect_to(fuels_url) }
      format.xml  { head :ok }
    end
  end
end
