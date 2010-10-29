require 'test_helper'

class ColumnFiltersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:column_filters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create column_filter" do
    assert_difference('ColumnFilter.count') do
      post :create, :column_filter => { }
    end

    assert_redirected_to column_filter_path(assigns(:column_filter))
  end

  test "should show column_filter" do
    get :show, :id => column_filters(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => column_filters(:one).to_param
    assert_response :success
  end

  test "should update column_filter" do
    put :update, :id => column_filters(:one).to_param, :column_filter => { }
    assert_redirected_to column_filter_path(assigns(:column_filter))
  end

  test "should destroy column_filter" do
    assert_difference('ColumnFilter.count', -1) do
      delete :destroy, :id => column_filters(:one).to_param
    end

    assert_redirected_to column_filters_path
  end
end
