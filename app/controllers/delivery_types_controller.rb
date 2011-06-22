# encoding: utf-8

class DeliveryTypesController < ApplicationController
  # GET /delivery_types
  # GET /delivery_types.xml
  def index
    @delivery_types = DeliveryType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @delivery_types }
    end
  end

  # GET /delivery_types/1
  # GET /delivery_types/1.xml
  def show
    @delivery_type = DeliveryType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @delivery_type }
    end
  end

  # GET /delivery_types/new
  # GET /delivery_types/new.xml
  def new
    @delivery_type = DeliveryType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @delivery_type }
    end
  end

  # GET /delivery_types/1/edit
  def edit
    @delivery_type = DeliveryType.find(params[:id])
  end

  # POST /delivery_types
  # POST /delivery_types.xml
  def create
    @delivery_type = DeliveryType.new(params[:delivery_type])

    respond_to do |format|
      if @delivery_type.save
        format.html { redirect_to(@delivery_type, :notice => 'DeliveryType was successfully created.') }
        format.xml  { render :xml => @delivery_type, :status => :created, :location => @delivery_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @delivery_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /delivery_types/1
  # PUT /delivery_types/1.xml
  def update
    @delivery_type = DeliveryType.find(params[:id])

    respond_to do |format|
      if @delivery_type.update_attributes(params[:delivery_type])
        format.html { redirect_to(@delivery_type, :notice => 'DeliveryType was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @delivery_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_types/1
  # DELETE /delivery_types/1.xml
  def destroy
    @delivery_type = DeliveryType.find(params[:id])
    @delivery_type.destroy

    respond_to do |format|
      format.html { redirect_to(delivery_types_url) }
      format.xml  { head :ok }
    end
  end
end
