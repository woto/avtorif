# encoding: utf-8

class EmailReceivesController < ApplicationController
  # GET /email_receives
  # GET /email_receives.xml
  def index
    @email_receives = EmailReceive.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @email_receives }
    end
  end

  # GET /email_receives/1
  # GET /email_receives/1.xml
  def show
    @email_receive = EmailReceive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @email_receive }
    end
  end

  # GET /email_receives/new
  # GET /email_receives/new.xml
  def new
    @email_receive = EmailReceive.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @email_receive }
    end
  end

  # GET /email_receives/1/edit
  def edit
    @email_receive = EmailReceive.find(params[:id])
  end

  # POST /email_receives
  # POST /email_receives.xml
  def create
    @email_receive = EmailReceive.new(params[:email_receive])
    receive_job = ReceiveJob.create(:receiveable => @email_receive)
    Job.update(params[:job_id], :jobable => receive_job)

    respond_to do |format|
      if @email_receive.save
        format.html { redirect_to(supplier_jobs_path(params[:supplier_id]), :notice => 'EmailReceive was successfully created.') }
        format.xml  { render :xml => @email_receive, :status => :created, :location => @email_receive }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @email_receive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /email_receives/1
  # PUT /email_receives/1.xml
  def update
    @email_receive = EmailReceive.find(params[:id])

    respond_to do |format|
      if @email_receive.update_attributes(params[:email_receive])
        format.html { redirect_to(supplier_jobs_path(params[:supplier_id]), :notice => 'EmailReceive was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @email_receive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /email_receives/1
  # DELETE /email_receives/1.xml
  def destroy
    @email_receive = EmailReceive.find(params[:id])
    @email_receive.destroy

    respond_to do |format|
      format.html { redirect_to(email_receives_url) }
      format.xml  { head :ok }
    end
  end
end
