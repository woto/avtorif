class DiscountRulesController < ApplicationController
  # GET /discount_rules
  # GET /discount_rules.xml
  def index
    @discount_rules = DiscountRule.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @discount_rules }
    end
  end

  # GET /discount_rules/1
  # GET /discount_rules/1.xml
  def show
    @discount_rule = DiscountRule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @discount_rule }
    end
  end

  # GET /discount_rules/new
  # GET /discount_rules/new.xml
  def new
    @discount_rule = DiscountRule.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @discount_rule }
    end
  end

  # GET /discount_rules/1/edit
  def edit
    @discount_rule = DiscountRule.find(params[:id])
  end

  # POST /discount_rules
  # POST /discount_rules.xml
  def create
    @discount_rule = DiscountRule.new(params[:discount_rule])

    respond_to do |format|
      if @discount_rule.save
        format.html { redirect_to(@discount_rule, :notice => 'Discount rule was successfully created.') }
        format.xml  { render :xml => @discount_rule, :status => :created, :location => @discount_rule }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @discount_rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /discount_rules/1
  # PUT /discount_rules/1.xml
  def update
    @discount_rule = DiscountRule.find(params[:id])

    respond_to do |format|
      if @discount_rule.update_attributes(params[:discount_rule])
        format.html { redirect_to(@discount_rule, :notice => 'Discount rule was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @discount_rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /discount_rules/1
  # DELETE /discount_rules/1.xml
  def destroy
    @discount_rule = DiscountRule.find(params[:id])
    @discount_rule.destroy

    respond_to do |format|
      format.html { redirect_to(discount_rules_url) }
      format.xml  { head :ok }
    end
  end
end
