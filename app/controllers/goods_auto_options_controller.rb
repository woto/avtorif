# encoding: utf-8

class GoodsAutoOptionsController < ApplicationController
  # GET /goods_auto_options
  # GET /goods_auto_options.xml
  def index
    @goods_auto_options = GoodsAutoOption.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @goods_auto_options }
    end
  end

  # GET /goods_auto_options/1
  # GET /goods_auto_options/1.xml
  def show
    @goods_auto_option = GoodsAutoOption.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @goods_auto_option }
    end
  end

  # GET /goods_auto_options/new
  # GET /goods_auto_options/new.xml
  def new
    @goods_auto_option = GoodsAutoOption.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @goods_auto_option }
    end
  end

  # GET /goods_auto_options/1/edit
  def edit
    @goods_auto_option = GoodsAutoOption.find(params[:id])
  end

  # POST /goods_auto_options
  # POST /goods_auto_options.xml
  def create
    @goods_auto_option = GoodsAutoOption.new(params[:goods_auto_option])

    respond_to do |format|
      if @goods_auto_option.save
        format.html { redirect_to(@goods_auto_option, :notice => 'GoodsAutoOption was successfully created.') }
        format.xml  { render :xml => @goods_auto_option, :status => :created, :location => @goods_auto_option }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @goods_auto_option.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /goods_auto_options/1
  # PUT /goods_auto_options/1.xml
  def update
    @goods_auto_option = GoodsAutoOption.find(params[:id])

    respond_to do |format|
      if @goods_auto_option.update_attributes(params[:goods_auto_option])
        format.html { redirect_to(@goods_auto_option, :notice => 'GoodsAutoOption was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @goods_auto_option.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /goods_auto_options/1
  # DELETE /goods_auto_options/1.xml
  def destroy
    @goods_auto_option = GoodsAutoOption.find(params[:id])
    @goods_auto_option.destroy

    respond_to do |format|
      format.html { redirect_to(goods_auto_options_url) }
      format.xml  { head :ok }
    end
  end
end
