class ColumnRelationsController < ApplicationController
  # GET /column_relations
  # GET /column_relations.xml
  def index
    @column_relations = ColumnRelation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @column_relations }
    end
  end

  # GET /column_relations/1
  # GET /column_relations/1.xml
  def show
    @column_relation = ColumnRelation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @column_relation }
    end
  end

  # GET /column_relations/new
  # GET /column_relations/new.xml
  def new
    @column_relation = ColumnRelation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @column_relation }
    end
  end

  # GET /column_relations/1/edit
  def edit
    @column_relation = ColumnRelation.find(params[:id])
  end

  # POST /column_relations
  # POST /column_relations.xml
  def create
    @column_relation = ColumnRelation.new(params[:column_relation])

    respond_to do |format|
      if @column_relation.save
        format.html { redirect_to(@column_relation, :notice => 'ColumnRelation was successfully created.') }
        format.xml  { render :xml => @column_relation, :status => :created, :location => @column_relation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @column_relation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /column_relations/1
  # PUT /column_relations/1.xml
  def update
    @column_relation = ColumnRelation.find(params[:id])

    respond_to do |format|
      if @column_relation.update_attributes(params[:column_relation])
        format.html { redirect_to(@column_relation, :notice => 'ColumnRelation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @column_relation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /column_relations/1
  # DELETE /column_relations/1.xml
  def destroy
    @column_relation = ColumnRelation.find(params[:id])
    @column_relation.destroy

    respond_to do |format|
      format.html { redirect_to(column_relations_url) }
      format.xml  { head :ok }
    end
  end
end
