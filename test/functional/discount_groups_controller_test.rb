require 'test_helper'

class DiscountGroupsControllerTest < ActionController::TestCase
  setup do
    @discount_group = discount_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discount_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create discount_group" do
    assert_difference('DiscountGroup.count') do
      post :create, :discount_group => @discount_group.attributes
    end

    assert_redirected_to discount_group_path(assigns(:discount_group))
  end

  test "should show discount_group" do
    get :show, :id => @discount_group.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @discount_group.to_param
    assert_response :success
  end

  test "should update discount_group" do
    put :update, :id => @discount_group.to_param, :discount_group => @discount_group.attributes
    assert_redirected_to discount_group_path(assigns(:discount_group))
  end

  test "should destroy discount_group" do
    assert_difference('DiscountGroup.count', -1) do
      delete :destroy, :id => @discount_group.to_param
    end

    assert_redirected_to discount_groups_path
  end
end
