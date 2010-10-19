require 'test_helper'

class GearsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gears)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gear" do
    assert_difference('Gear.count') do
      post :create, :gear => { }
    end

    assert_redirected_to gear_path(assigns(:gear))
  end

  test "should show gear" do
    get :show, :id => gears(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => gears(:one).to_param
    assert_response :success
  end

  test "should update gear" do
    put :update, :id => gears(:one).to_param, :gear => { }
    assert_redirected_to gear_path(assigns(:gear))
  end

  test "should destroy gear" do
    assert_difference('Gear.count', -1) do
      delete :destroy, :id => gears(:one).to_param
    end

    assert_redirected_to gears_path
  end
end
