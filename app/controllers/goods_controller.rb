class GoodsController < ApplicationController
  # GET /goods
  # GET /goods.xml
  def index
    @goods = Goods.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @goods }
    end
  end

  # GET /goods/1
  # GET /goods/1.xml
  def show
    @goods = Goods.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @goods }
    end
  end

  # GET /goods/new
  # GET /goods/new.xml
  def new
    @goods = Goods.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @goods }
    end
  end

  # GET /goods/1/edit
  def edit
    @goods = Goods.find(params[:id])
  end

  # POST /goods
  # POST /goods.xml
  def create
    @goods = Goods.new(params[:goods])

    respond_to do |format|
      if @goods.save
        format.html { redirect_to(@goods, :notice => 'Goods was successfully created.') }
        format.xml  { render :xml => @goods, :status => :created, :location => @goods }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @goods.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /goods/1
  # PUT /goods/1.xml
  def update
    @goods = Goods.find(params[:id])

    respond_to do |format|
      if @goods.update_attributes(params[:goods])
        format.html { redirect_to(@goods, :notice => 'Goods was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @goods.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /goods/1
  # DELETE /goods/1.xml
  def destroy
    @goods = Goods.find(params[:id])
    @goods.destroy

    respond_to do |format|
      format.html { redirect_to(goods_url) }
      format.xml  { head :ok }
    end
  end
end
