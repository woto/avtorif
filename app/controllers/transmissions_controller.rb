# encoding: utf-8

class TransmissionsController < ApplicationController
  # GET /transmissions
  # GET /transmissions.xml
  def index
    @transmissions = Transmission.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transmissions }
    end
  end

  # GET /transmissions/1
  # GET /transmissions/1.xml
  def show
    @transmission = Transmission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transmission }
    end
  end

  # GET /transmissions/new
  # GET /transmissions/new.xml
  def new
    @transmission = Transmission.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transmission }
    end
  end

  # GET /transmissions/1/edit
  def edit
    @transmission = Transmission.find(params[:id])
  end

  # POST /transmissions
  # POST /transmissions.xml
  def create
    @transmission = Transmission.new(params[:transmission])

    respond_to do |format|
      if @transmission.save
        format.html { redirect_to(@transmission, :notice => 'Transmission was successfully created.') }
        format.xml  { render :xml => @transmission, :status => :created, :location => @transmission }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transmission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transmissions/1
  # PUT /transmissions/1.xml
  def update
    @transmission = Transmission.find(params[:id])

    respond_to do |format|
      if @transmission.update_attributes(params[:transmission])
        format.html { redirect_to(@transmission, :notice => 'Transmission was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transmission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transmissions/1
  # DELETE /transmissions/1.xml
  def destroy
    @transmission = Transmission.find(params[:id])
    @transmission.destroy

    respond_to do |format|
      format.html { redirect_to(transmissions_url) }
      format.xml  { head :ok }
    end
  end
end
