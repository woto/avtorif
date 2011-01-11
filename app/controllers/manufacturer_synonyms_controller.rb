class ManufacturerSynonymsController < ApplicationController
  # GET /manufacturer_synonyms
  # GET /manufacturer_synonyms.xml
  def index
    @manufacturer_synonyms = ManufacturerSynonym.where(:manufacturer_id => params[:manufacturer_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @manufacturer_synonyms }
    end
  end

  # GET /manufacturer_synonyms/1
  # GET /manufacturer_synonyms/1.xml
  def show
    @manufacturer_synonym = ManufacturerSynonym.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @manufacturer_synonym }
    end
  end

  # GET /manufacturer_synonyms/new
  # GET /manufacturer_synonyms/new.xml
  def new
    @manufacturer_synonym = ManufacturerSynonym.new(:manufacturer_id => params[:manufacturer_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @manufacturer_synonym }
    end
  end

  # GET /manufacturer_synonyms/1/edit
  def edit
    @manufacturer_synonym = ManufacturerSynonym.find(params[:id])
  end

  # POST /manufacturer_synonyms
  # POST /manufacturer_synonyms.xml
  def create
    @manufacturer_synonym = ManufacturerSynonym.new(params[:manufacturer_synonym])

    respond_to do |format|
      if @manufacturer_synonym.save
        format.html { redirect_to(manufacturer_manufacturer_synonym_path(@manufacturer_synonym.manufacturer_id, @manufacturer_synonym), :notice => 'manufacturer synonym was successfully created.') }
        format.xml  { render :xml => @manufacturer_synonym, :status => :created, :location => @manufacturer_synonym }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @manufacturer_synonym.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /manufacturer_synonyms/1
  # PUT /manufacturer_synonyms/1.xml
  def update
    @manufacturer_synonym = ManufacturerSynonym.find(params[:id])

    respond_to do |format|
      if @manufacturer_synonym.update_attributes(params[:manufacturer_synonym])
        format.html { redirect_to(manufacturer_manufacturer_synonym_path(@manufacturer_synonym.manufacturer_id, @manufacturer_synonym), :notice => 'Manufacturer synonym was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @manufacturer_synonym.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /manufacturer_synonyms/1
  # DELETE /manufacturer_synonyms/1.xml
  def destroy
    @manufacturer_synonym = ManufacturerSynonym.find(params[:id])
    manufacturer_id = @manufacturer_synonym.manufacturer_id
    @manufacturer_synonym.destroy

    respond_to do |format|
      format.html { redirect_to(manufacturer_manufacturer_synonyms_url) }
      format.xml  { head :ok }
    end
  end
end
