# encoding: utf-8

class HttpReceivesController < ApplicationController
  # GET /http_receives
  # GET /http_receives.xml
  def index
    @http_receives = HttpReceive.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @http_receives }
    end
  end

  # GET /http_receives/1
  # GET /http_receives/1.xml
  def show
    @http_receive = HttpReceive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @http_receive }
    end
  end

  # GET /http_receives/new
  # GET /http_receives/new.xml
  def new
    @http_receive = HttpReceive.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @http_receive }
    end
  end

  # GET /http_receives/1/edit
  def edit
    @http_receive = HttpReceive.find(params[:id])
  end

  # POST /http_receives
  # POST /http_receives.xml
  def create
    @http_receive = HttpReceive.new(params[:http_receive])
    receive_job = ReceiveJob.create(:receiveable => @http_receive)
    Job.update(params[:job_id], :jobable => receive_job)

    respond_to do |format|
      if @http_receive.save
        format.html { redirect_to(supplier_jobs_path(params[:supplier_id]), :notice => 'HttpReceive was successfully created.') }
        format.xml  { render :xml => @http_receive, :status => :created, :location => @http_receive }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @http_receive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /http_receives/1
  # PUT /http_receives/1.xml
  def update
    @http_receive = HttpReceive.find(params[:id])

    respond_to do |format|
      if @http_receive.update_attributes(params[:http_receive])
        format.html { redirect_to(supplier_jobs_path(params[:supplier_id]), :notice => 'HttpReceive was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @http_receive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /http_receives/1
  # DELETE /http_receives/1.xml
  def destroy
    @http_receive = HttpReceive.find(params[:id])
    @http_receive.destroy

    respond_to do |format|
      format.html { redirect_to(http_receives_url) }
      format.xml  { head :ok }
    end
  end
end
