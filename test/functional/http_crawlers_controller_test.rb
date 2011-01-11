require 'test_helper'

class HttpCrawlersControllerTest < ActionController::TestCase
  setup do
    @http_crawler = http_crawlers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:http_crawlers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create http_crawler" do
    assert_difference('HttpCrawler.count') do
      post :create, :http_crawler => @http_crawler.attributes
    end

    assert_redirected_to http_crawler_path(assigns(:http_crawler))
  end

  test "should show http_crawler" do
    get :show, :id => @http_crawler.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @http_crawler.to_param
    assert_response :success
  end

  test "should update http_crawler" do
    put :update, :id => @http_crawler.to_param, :http_crawler => @http_crawler.attributes
    assert_redirected_to http_crawler_path(assigns(:http_crawler))
  end

  test "should destroy http_crawler" do
    assert_difference('HttpCrawler.count', -1) do
      delete :destroy, :id => @http_crawler.to_param
    end

    assert_redirected_to http_crawlers_path
  end
end
