class ReceiveEmailsController < ApplicationController
  # GET /receive_emails
  # GET /receive_emails.xml
  def index
    @receive_emails = EmailReceive.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @receive_emails }
    end
  end

  # GET /receive_emails/1
  # GET /receive_emails/1.xml
  def show
    @receive_email = EmailReceive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @receive_email }
    end
  end

  # GET /receive_emails/new
  # GET /receive_emails/new.xml
  def new
    @receive_email = EmailReceive.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @receive_email }
    end
  end

  # GET /receive_emails/1/edit
  def edit
    @receive_email = EmailReceive.find(params[:id])
  end

  # POST /receive_emails
  # POST /receive_emails.xml
  def create
    @receive_email = EmailReceive.new(params[:receive_email])

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

  # PUT /receive_emails/1
  # PUT /receive_emails/1.xml
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

  # DELETE /receive_emails/1
  # DELETE /receive_emails/1.xml
  def destroy
    @receive_email = EmailReceive.find(params[:id])
    @receive_email.destroy

    respond_to do |format|
      format.html { redirect_to(receive_emails_url) }
      format.xml  { head :ok }
    end
  end
end
