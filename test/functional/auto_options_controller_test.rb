require 'test_helper'

class AutoOptionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:auto_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create auto_option" do
    assert_difference('AutoOption.count') do
      post :create, :auto_option => { }
    end

    assert_redirected_to auto_option_path(assigns(:auto_option))
  end

  test "should show auto_option" do
    get :show, :id => auto_options(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => auto_options(:one).to_param
    assert_response :success
  end

  test "should update auto_option" do
    put :update, :id => auto_options(:one).to_param, :auto_option => { }
    assert_redirected_to auto_option_path(assigns(:auto_option))
  end

  test "should destroy auto_option" do
    assert_difference('AutoOption.count', -1) do
      delete :destroy, :id => auto_options(:one).to_param
    end

    assert_redirected_to auto_options_path
  end
end
