require 'test_helper'

class TransmissionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transmissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transmission" do
    assert_difference('Transmission.count') do
      post :create, :transmission => { }
    end

    assert_redirected_to transmission_path(assigns(:transmission))
  end

  test "should show transmission" do
    get :show, :id => transmissions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => transmissions(:one).to_param
    assert_response :success
  end

  test "should update transmission" do
    put :update, :id => transmissions(:one).to_param, :transmission => { }
    assert_redirected_to transmission_path(assigns(:transmission))
  end

  test "should destroy transmission" do
    assert_difference('Transmission.count', -1) do
      delete :destroy, :id => transmissions(:one).to_param
    end

    assert_redirected_to transmissions_path
  end
end
