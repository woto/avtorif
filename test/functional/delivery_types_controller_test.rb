require 'test_helper'

class DeliveryTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:delivery_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create delivery_type" do
    assert_difference('DeliveryType.count') do
      post :create, :delivery_type => { }
    end

    assert_redirected_to delivery_type_path(assigns(:delivery_type))
  end

  test "should show delivery_type" do
    get :show, :id => delivery_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => delivery_types(:one).to_param
    assert_response :success
  end

  test "should update delivery_type" do
    put :update, :id => delivery_types(:one).to_param, :delivery_type => { }
    assert_redirected_to delivery_type_path(assigns(:delivery_type))
  end

  test "should destroy delivery_type" do
    assert_difference('DeliveryType.count', -1) do
      delete :destroy, :id => delivery_types(:one).to_param
    end

    assert_redirected_to delivery_types_path
  end
end
