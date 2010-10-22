require 'test_helper'

class HttpReceivesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:http_receives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create http_receive" do
    assert_difference('HttpReceive.count') do
      post :create, :http_receive => { }
    end

    assert_redirected_to http_receive_path(assigns(:http_receive))
  end

  test "should show http_receive" do
    get :show, :id => http_receives(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => http_receives(:one).to_param
    assert_response :success
  end

  test "should update http_receive" do
    put :update, :id => http_receives(:one).to_param, :http_receive => { }
    assert_redirected_to http_receive_path(assigns(:http_receive))
  end

  test "should destroy http_receive" do
    assert_difference('HttpReceive.count', -1) do
      delete :destroy, :id => http_receives(:one).to_param
    end

    assert_redirected_to http_receives_path
  end
end
