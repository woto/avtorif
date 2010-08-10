class MiesController < ApplicationController
  # GET /mies
  # GET /mies.xml
  def index

    rj = ImportJobber.new(ImportJob.find(121088585))
    rj.perform

    #rj = ReceiveJobber.new(ReceiveJob.find(484199613))
    #rj.perform
    
    @mies = My.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mies }
    end
  end

  # GET /mies/1
  # GET /mies/1.xml
  def show
    @my = My.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @my }
    end
  end

  # GET /mies/new
  # GET /mies/new.xml
  def new
    @my = My.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @my }
    end
  end

  # GET /mies/1/edit
  def edit
    @my = My.find(params[:id])
  end

  # POST /mies
  # POST /mies.xml
  def create
    @my = My.new(params[:my])

    respond_to do |format|
      if @my.save
        format.html { redirect_to(@my, :notice => 'My was successfully created.') }
        format.xml  { render :xml => @my, :status => :created, :location => @my }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @my.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mies/1
  # PUT /mies/1.xml
  def update
    @my = My.find(params[:id])

    respond_to do |format|
      if @my.update_attributes(params[:my])
        format.html { redirect_to(@my, :notice => 'My was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @my.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mies/1
  # DELETE /mies/1.xml
  def destroy
    @my = My.find(params[:id])
    @my.destroy

    respond_to do |format|
      format.html { redirect_to(mies_url) }
      format.xml  { head :ok }
    end
  end
end
