# encoding: utf-8

class AnaloguesController < ApplicationController
  # GET /analogues
  # GET /analogues.xml
  def index
    @analogues = Analogue.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @analogues }
    end
  end

  # GET /analogues/1
  # GET /analogues/1.xml
  def show
    @analogue = Analogue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @analogue }
    end
  end

  # GET /analogues/new
  # GET /analogues/new.xml
  def new
    @analogue = Analogue.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @analogue }
    end
  end

  # GET /analogues/1/edit
  def edit
    @analogue = Analogue.find(params[:id])
  end

  # POST /analogues
  # POST /analogues.xml
  def create
    @analogue = Analogue.new(params[:analogue])

    respond_to do |format|
      if @analogue.save
        format.html { redirect_to(@analogue, :notice => 'Analogue was successfully created.') }
        format.xml  { render :xml => @analogue, :status => :created, :location => @analogue }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @analogue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /analogues/1
  # PUT /analogues/1.xml
  def update
    @analogue = Analogue.find(params[:id])

    respond_to do |format|
      if @analogue.update_attributes(params[:analogue])
        format.html { redirect_to(@analogue, :notice => 'Analogue was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @analogue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /analogues/1
  # DELETE /analogues/1.xml
  def destroy
    @analogue = Analogue.find(params[:id])
    @analogue.destroy

    respond_to do |format|
      format.html { redirect_to(analogues_url) }
      format.xml  { head :ok }
    end
  end
end
