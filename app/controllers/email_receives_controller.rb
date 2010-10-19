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
    @receive_email = EmailReceive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @receive_email }
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
    @receive_email = EmailReceive.find(params[:id])
  end

  # POST /email_receives
  # POST /email_receives.xml
  def create
    @receive_email = EmailReceive.new(params[:email_receives])
    receive_job = ReceiveJob.create(:receiveable => @receive_email)
    Job.update(params[:job_id], :jobable => receive_job)

    respond_to do |format|
      if @receive_email.save
        format.html { redirect_to(@receive_email, :notice => 'EmailReceive was successfully created.') }
        format.xml  { render :xml => @receive_email, :status => :created, :location => @receive_email }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @receive_email.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /email_receives/1
  # PUT /email_receives/1.xml
  def update
    @receive_email = EmailReceive.find(params[:id])

    respond_to do |format|
      if @receive_email.update_attributes(params[:receive_email])
        format.html { redirect_to(@receive_email, :notice => 'EmailReceive was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @receive_email.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /email_receives/1
  # DELETE /email_receives/1.xml
  def destroy
    @receive_email = EmailReceive.find(params[:id])
    @receive_email.destroy

    respond_to do |format|
      format.html { redirect_to(receive_emails_url) }
      format.xml  { head :ok }
    end
  end
end
