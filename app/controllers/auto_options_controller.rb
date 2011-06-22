# encoding: utf-8

class AutoOptionsController < ApplicationController
  # GET /auto_options
  # GET /auto_options.xml
  def index
    @auto_options = AutoOption.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @auto_options }
    end
  end

  # GET /auto_options/1
  # GET /auto_options/1.xml
  def show
    @auto_option = AutoOption.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @auto_option }
    end
  end

  # GET /auto_options/new
  # GET /auto_options/new.xml
  def new
    @auto_option = AutoOption.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @auto_option }
    end
  end

  # GET /auto_options/1/edit
  def edit
    @auto_option = AutoOption.find(params[:id])
  end

  # POST /auto_options
  # POST /auto_options.xml
  def create
    @auto_option = AutoOption.new(params[:auto_option])

    respond_to do |format|
      if @auto_option.save
        format.html { redirect_to(@auto_option, :notice => 'AutoOption was successfully created.') }
        format.xml  { render :xml => @auto_option, :status => :created, :location => @auto_option }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @auto_option.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /auto_options/1
  # PUT /auto_options/1.xml
  def update
    @auto_option = AutoOption.find(params[:id])

    respond_to do |format|
      if @auto_option.update_attributes(params[:auto_option])
        format.html { redirect_to(@auto_option, :notice => 'AutoOption was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @auto_option.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /auto_options/1
  # DELETE /auto_options/1.xml
  def destroy
    @auto_option = AutoOption.find(params[:id])
    @auto_option.destroy

    respond_to do |format|
      format.html { redirect_to(auto_options_url) }
      format.xml  { head :ok }
    end
  end
end
