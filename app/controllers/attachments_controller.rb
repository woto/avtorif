class AttachmentsController < ApplicationController
  # GET /attachments
  # GET /attachments.xml
  def index
    @attachments = Attachment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @attachments }
    end
  end

  # GET /attachments/1
  # GET /attachments/1.xml
  def show
    @attachment = Attachment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attachment }
    end
  end

  # GET /attachments/new
  # GET /attachments/new.xml
  def new
    @attachment = Attachment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attachment }
    end
  end

  # GET /attachments/1/edit
  def edit
    @attachment = Attachment.find(params[:id])
  end

  # POST /attachments
  # POST /attachments.xml
  def create

    md5 = Digest::MD5.file(params[:attachment][:attachment].path).hexdigest
    supplier_id = params[:attachment][:supplier_id]
    
    #@attachment = Attachment.new(params[:attachment])
    #@attachment.md5 = Digest::MD5.hexdigest(File.read())

    if Attachment.find(:first, :conditions => ['md5 = ? AND supplier_id = ?',  md5, supplier_id]).nil?
      
      @attachment = Attachment.new(params[:attachment])
      @attachment.md5 = md5

      respond_to do |format|
        if @attachment.save

          #Job.all(params[:supplier_id])
          #ijs = ImportJob.find(:all, :conditions => {:job => {:supplier_id => params[:attachment][:supplier_id]}}, :joins => "INNER JOIN import_jobs ij ON ij.id = jobs.jobable_id ")
          #ijs = ImportJob.find(:all, :conditions => {:jobs => {:supplier_id => params[:attachment][:supplier_id]}}, :joins => "INNER JOIN jobs ON import_jobs.id = jobs.jobable_id ")
          ijs = ImportJob.find(:all, :conditions => {:jobs => {:supplier_id => params[:attachment][:supplier_id]}}, :joins => :job)
          ijs = ijs.select{|ij| ij.job.file_mask.match(params[:attachment][:attachment].original_filename)}
          ijs.each do |ij|
            Delayed::Job.enqueue(ImportJobber.new(ij, @attachment.id))
            #ImportJobber.new(ij, @attachment.id).perform
          end

          format.html { redirect_to(@attachment, :notice => 'Attachment was successfully created.') }
          format.xml  { render :xml => @attachment, :status => :created, :location => @attachment }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @attachment.errors, :status => :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to(attachments_path, :notice => 'Загружаемый файл уже имеется на сервере.') }
      end
    end
  end

  # PUT /attachments/1
  # PUT /attachments/1.xml
  def update
    @attachment = Attachment.find(params[:id])

    respond_to do |format|
      if @attachment.update_attributes(params[:attachment])
        format.html { redirect_to(@attachment, :notice => 'Attachment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attachment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.xml
  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to(attachments_url) }
      format.xml  { head :ok }
    end
  end
end
