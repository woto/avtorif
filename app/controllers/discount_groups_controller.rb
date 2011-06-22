# encoding: utf-8

class DiscountGroupsController < ApplicationController
  # GET /discount_groups
  # GET /discount_groups.xml
  def index
    @discount_groups = DiscountGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @discount_groups }
    end
  end

  # GET /discount_groups/1
  # GET /discount_groups/1.xml
  def show
    @discount_group = DiscountGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @discount_group }
    end
  end

  # GET /discount_groups/new
  # GET /discount_groups/new.xml
  def new
    @discount_group = DiscountGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @discount_group }
    end
  end

  # GET /discount_groups/1/edit
  def edit
    @discount_group = DiscountGroup.find(params[:id])
  end

  # POST /discount_groups
  # POST /discount_groups.xml
  def create
    @discount_group = DiscountGroup.new(params[:discount_group])

    respond_to do |format|
      if @discount_group.save
        format.html { redirect_to(@discount_group, :notice => 'Discount group was successfully created.') }
        format.xml  { render :xml => @discount_group, :status => :created, :location => @discount_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @discount_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /discount_groups/1
  # PUT /discount_groups/1.xml
  def update
    @discount_group = DiscountGroup.find(params[:id])

    respond_to do |format|
      if @discount_group.update_attributes(params[:discount_group])
        format.html { redirect_to(@discount_group, :notice => 'Discount group was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @discount_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /discount_groups/1
  # DELETE /discount_groups/1.xml
  def destroy
    @discount_group = DiscountGroup.find(params[:id])
    @discount_group.destroy

    respond_to do |format|
      format.html { redirect_to(discount_groups_url) }
      format.xml  { head :ok }
    end
  end
end
