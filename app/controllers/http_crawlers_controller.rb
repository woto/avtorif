class HttpCrawlersController < ApplicationController
  # GET /http_crawlers
  # GET /http_crawlers.xml
  def index
    @http_crawlers = HttpCrawler.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @http_crawlers }
    end
  end

  # GET /http_crawlers/1
  # GET /http_crawlers/1.xml
  def show
    @http_crawler = HttpCrawler.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @http_crawler }
    end
  end

  # GET /http_crawlers/new
  # GET /http_crawlers/new.xml
  def new
    @http_crawler = HttpCrawler.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @http_crawler }
    end
  end

  # GET /http_crawlers/1/edit
  def edit
    @http_crawler = HttpCrawler.find(params[:id])
  end

  # POST /http_crawlers
  # POST /http_crawlers.xml
  def create
    @http_crawler = HttpCrawler.new(params[:http_crawler])

    respond_to do |format|
      if @http_crawler.save
        format.html { redirect_to(@http_crawler, :notice => 'Http crawler was successfully created.') }
        format.xml  { render :xml => @http_crawler, :status => :created, :location => @http_crawler }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @http_crawler.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /http_crawlers/1
  # PUT /http_crawlers/1.xml
  def update
    @http_crawler = HttpCrawler.find(params[:id])

    respond_to do |format|
      if @http_crawler.update_attributes(params[:http_crawler])
        format.html { redirect_to(@http_crawler, :notice => 'Http crawler was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @http_crawler.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /http_crawlers/1
  # DELETE /http_crawlers/1.xml
  def destroy
    @http_crawler = HttpCrawler.find(params[:id])
    @http_crawler.destroy

    respond_to do |format|
      format.html { redirect_to(http_crawlers_url) }
      format.xml  { head :ok }
    end
  end
end
