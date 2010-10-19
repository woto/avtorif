require 'test_helper'

class AutosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:autos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create auto" do
    assert_difference('Auto.count') do
      post :create, :auto => { }
    end

    assert_redirected_to auto_path(assigns(:auto))
  end

  test "should show auto" do
    get :show, :id => autos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => autos(:one).to_param
    assert_response :success
  end

  test "should update auto" do
    put :update, :id => autos(:one).to_param, :auto => { }
    assert_redirected_to auto_path(assigns(:auto))
  end

  test "should destroy auto" do
    assert_difference('Auto.count', -1) do
      delete :destroy, :id => autos(:one).to_param
    end

    assert_redirected_to autos_path
  end
end
