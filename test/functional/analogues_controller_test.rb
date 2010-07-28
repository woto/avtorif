require 'test_helper'

class AnaloguesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:analogues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create analogue" do
    assert_difference('Analogue.count') do
      post :create, :analogue => { }
    end

    assert_redirected_to analogue_path(assigns(:analogue))
  end

  test "should show analogue" do
    get :show, :id => analogues(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => analogues(:one).to_param
    assert_response :success
  end

  test "should update analogue" do
    put :update, :id => analogues(:one).to_param, :analogue => { }
    assert_redirected_to analogue_path(assigns(:analogue))
  end

  test "should destroy analogue" do
    assert_difference('Analogue.count', -1) do
      delete :destroy, :id => analogues(:one).to_param
    end

    assert_redirected_to analogues_path
  end
end
