require 'test_helper'

class GoodsAutoOptionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goods_auto_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goods_auto_option" do
    assert_difference('GoodsAutoOption.count') do
      post :create, :goods_auto_option => { }
    end

    assert_redirected_to goods_auto_option_path(assigns(:goods_auto_option))
  end

  test "should show goods_auto_option" do
    get :show, :id => goods_auto_options(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => goods_auto_options(:one).to_param
    assert_response :success
  end

  test "should update goods_auto_option" do
    put :update, :id => goods_auto_options(:one).to_param, :goods_auto_option => { }
    assert_redirected_to goods_auto_option_path(assigns(:goods_auto_option))
  end

  test "should destroy goods_auto_option" do
    assert_difference('GoodsAutoOption.count', -1) do
      delete :destroy, :id => goods_auto_options(:one).to_param
    end

    assert_redirected_to goods_auto_options_path
  end
end
