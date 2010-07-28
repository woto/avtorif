require 'test_helper'

class GoodsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goods" do
    assert_difference('Goods.count') do
      post :create, :goods => { }
    end

    assert_redirected_to goods_path(assigns(:goods))
  end

  test "should show goods" do
    get :show, :id => goods(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => goods(:one).to_param
    assert_response :success
  end

  test "should update goods" do
    put :update, :id => goods(:one).to_param, :goods => { }
    assert_redirected_to goods_path(assigns(:goods))
  end

  test "should destroy goods" do
    assert_difference('Goods.count', -1) do
      delete :destroy, :id => goods(:one).to_param
    end

    assert_redirected_to goods_path
  end
end
