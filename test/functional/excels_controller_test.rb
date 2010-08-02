require 'test_helper'

class ExcelsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:excels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create excel" do
    assert_difference('Excel.count') do
      post :create, :excel => { }
    end

    assert_redirected_to excel_path(assigns(:excel))
  end

  test "should show excel" do
    get :show, :id => excels(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => excels(:one).to_param
    assert_response :success
  end

  test "should update excel" do
    put :update, :id => excels(:one).to_param, :excel => { }
    assert_redirected_to excel_path(assigns(:excel))
  end

  test "should destroy excel" do
    assert_difference('Excel.count', -1) do
      delete :destroy, :id => excels(:one).to_param
    end

    assert_redirected_to excels_path
  end
end
