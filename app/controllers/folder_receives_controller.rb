# encoding: utf-8

class FolderReceivesController < ApplicationController
  # GET /folder_receives
  # GET /folder_receives.xml
  def index
    @folders_receive = FolderReceive.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @folders_receive }
    end
  end

  # GET /folder_receives/1
  # GET /folder_receives/1.xml
  def show
    @folder_receive = FolderReceive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @folder_receive }
    end
  end

  # GET /folder_receives/new
  # GET /folder_receives/new.xml
  def new
    @folder_receive = FolderReceive.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @folder_receive }
    end
  end

  # GET /folder_receives/1/edit
  def edit
    @folder_receive = FolderReceive.find(params[:id])
  end

  # POST /folder_receives
  # POST /folder_receives.xml
  def create
    @folder_receive = FolderReceive.new(params[:folder_receive])
    receive_job = ReceiveJob.create(:receiveable => @folder_receive)
    Job.update(params[:job_id], :jobable => receive_job)

    respond_to do |format|
      if @folder_receive.save
        format.html { redirect_to(supplier_jobs_path(Job.find(params[:job_id]).supplier), :notice => 'FolderReceive was successfully created.') }
        format.xml  { render :xml => @folder_receive, :status => :created, :location => @folder_receive }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @folder_receive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /folder_receives/1
  # PUT /folder_receives/1.xml
  def update
    @folder_receive = FolderReceive.find(params[:id])

    respond_to do |format|
      if @folder_receive.update_attributes(params[:folder_receive])
        format.html { redirect_to(supplier_jobs_path(params[:supplier_id]), :notice => 'FolderReceive was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @folder_receive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /folder_receives/1
  # DELETE /folder_receives/1.xml
  def destroy
    @folder_receive = FolderReceive.find(params[:id])
    @folder_receive.destroy

    respond_to do |format|
      format.html { redirect_to(folders_receive_url) }
      format.xml  { head :ok }
    end
  end
end
