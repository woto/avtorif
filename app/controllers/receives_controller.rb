class ReceivesController < ApplicationController
  # GET /receives
  # GET /receives.xml
  def index
    @receives = Receive.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @receives }
    end
  end

  # GET /receives/1
  # GET /receives/1.xml
  def show
    @receive = Receive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @receive }
    end
  end

  # GET /receives/new
  # GET /receives/new.xml
  def new
    @receive = Receive.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @receive }
    end
  end

  # GET /receives/1/edit
  def edit
    @receive = Receive.find(params[:id])
  end

  # POST /receives
  # POST /receives.xml
  def create
    @receive = Receive.new(params[:receive])

    respond_to do |format|
      if @receive.save
        format.html { redirect_to(@receive, :notice => 'Receive was successfully created.') }
        format.xml  { render :xml => @receive, :status => :created, :location => @receive }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @receive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /receives/1
  # PUT /receives/1.xml
  def update
    @receive = Receive.find(params[:id])

    respond_to do |format|
      if @receive.update_attributes(params[:receive])
        format.html { redirect_to(@receive, :notice => 'Receive was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @receive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /receives/1
  # DELETE /receives/1.xml
  def destroy
    @receive = Receive.find(params[:id])
    @receive.destroy

    respond_to do |format|
      format.html { redirect_to(receives_url) }
      format.xml  { head :ok }
    end
  end
end
