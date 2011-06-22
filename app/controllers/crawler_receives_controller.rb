# encoding: utf-8

class CrawlerReceivesController < ApplicationController

  def start
    @crawler_receive = CrawlerReceive.find(params[:id])
    eval(@crawler_receive.instructions)
    redirect_to (crawler_receives_url)
  end

  # GET /crawler_receives
  # GET /crawler_receives.xml
  def index
    @crawler_receives = CrawlerReceive.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @crawler_receives }
    end
  end

  # GET /crawler_receives/1
  # GET /crawler_receives/1.xml
  def show
    @crawler_receive = CrawlerReceive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @crawler_receive }
    end
  end

  # GET /crawler_receives/new
  # GET /crawler_receives/new.xml
  def new
    @crawler_receive = CrawlerReceive.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @crawler_receive }
    end
  end

  # GET /crawler_receives/1/edit
  def edit
    @crawler_receive = CrawlerReceive.find(params[:id])
  end

  # POST /crawler_receives
  # POST /crawler_receives.xml
  def create
    @crawler_receive = CrawlerReceive.new(params[:crawler_receive])
    receive_job = ReceiveJob.create(:receiveable => @crawler_receive)
    Job.update(params[:job_id], :jobable => receive_job)

    respond_to do |format|
      if @crawler_receive.save
        format.html { redirect_to(supplier_jobs_path(params[:supplier_id]), :notice => 'Crawler receive was successfully created.') }
        format.xml  { render :xml => @crawler_receive, :status => :created, :location => @crawler_receive }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @crawler_receive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /crawler_receives/1
  # PUT /crawler_receives/1.xml
  def update
    @crawler_receive = CrawlerReceive.find(params[:id])

    respond_to do |format|
      if @crawler_receive.update_attributes(params[:crawler_receive])
        format.html { redirect_to(supplier_jobs_path(params[:supplier_id]), :notice => 'Crawler receive was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @crawler_receive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /crawler_receives/1
  # DELETE /crawler_receives/1.xml
  def destroy
    @crawler_receive = CrawlerReceive.find(params[:id])
    @crawler_receive.destroy

    respond_to do |format|
      format.html { redirect_to(crawler_receives_url) }
      format.xml  { head :ok }
    end
  end
end
