class ColumnFiltersController < ApplicationController
  # GET /column_filters
  # GET /column_filters.xml
  def index
    @column_filters = ColumnFilter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @column_filters }
    end
  end

  # GET /column_filters/1
  # GET /column_filters/1.xml
  def show
    @column_filter = ColumnFilter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @column_filter }
    end
  end

  # GET /column_filters/new
  # GET /column_filters/new.xml
  def new
    @column_filter = ColumnFilter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @column_filter }
    end
  end

  # GET /column_filters/1/edit
  def edit
    @column_filter = ColumnFilter.find(params[:id])
  end

  # POST /column_filters
  # POST /column_filters.xml
  def create
    @column_filter = ColumnFilter.new(params[:column_filter])

    respond_to do |format|
      if @column_filter.save
        format.html { redirect_to(@column_filter, :notice => 'ColumnFilter was successfully created.') }
        format.xml  { render :xml => @column_filter, :status => :created, :location => @column_filter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @column_filter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /column_filters/1
  # PUT /column_filters/1.xml
  def update
    @column_filter = ColumnFilter.find(params[:id])

    respond_to do |format|
      if @column_filter.update_attributes(params[:column_filter])
        format.html { redirect_to(@column_filter, :notice => 'ColumnFilter was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @column_filter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /column_filters/1
  # DELETE /column_filters/1.xml
  def destroy
    @column_filter = ColumnFilter.find(params[:id])
    @column_filter.destroy

    respond_to do |format|
      format.html { redirect_to(column_filters_url) }
      format.xml  { head :ok }
    end
  end
end
