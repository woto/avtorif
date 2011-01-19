require 'test_helper'

class CrawlerReceivesControllerTest < ActionController::TestCase
  setup do
    @crawler_receive = crawler_receives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crawler_receives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crawler_receive" do
    assert_difference('CrawlerReceive.count') do
      post :create, :crawler_receive => @crawler_receive.attributes
    end

    assert_redirected_to crawler_receive_path(assigns(:crawler_receive))
  end

  test "should show crawler_receive" do
    get :show, :id => @crawler_receive.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @crawler_receive.to_param
    assert_response :success
  end

  test "should update crawler_receive" do
    put :update, :id => @crawler_receive.to_param, :crawler_receive => @crawler_receive.attributes
    assert_redirected_to crawler_receive_path(assigns(:crawler_receive))
  end

  test "should destroy crawler_receive" do
    assert_difference('CrawlerReceive.count', -1) do
      delete :destroy, :id => @crawler_receive.to_param
    end

    assert_redirected_to crawler_receives_path
  end
end
