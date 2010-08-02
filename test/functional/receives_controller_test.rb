require 'test_helper'

class ReceivesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receive" do
    assert_difference('Receive.count') do
      post :create, :receive => { }
    end

    assert_redirected_to receive_path(assigns(:receive))
  end

  test "should show receive" do
    get :show, :id => receives(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => receives(:one).to_param
    assert_response :success
  end

  test "should update receive" do
    put :update, :id => receives(:one).to_param, :receive => { }
    assert_redirected_to receive_path(assigns(:receive))
  end

  test "should destroy receive" do
    assert_difference('Receive.count', -1) do
      delete :destroy, :id => receives(:one).to_param
    end

    assert_redirected_to receives_path
  end
end
