require 'test_helper'

class ColumnRelationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:column_relations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create column_relation" do
    assert_difference('ColumnRelation.count') do
      post :create, :column_relation => { }
    end

    assert_redirected_to column_relation_path(assigns(:column_relation))
  end

  test "should show column_relation" do
    get :show, :id => column_relations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => column_relations(:one).to_param
    assert_response :success
  end

  test "should update column_relation" do
    put :update, :id => column_relations(:one).to_param, :column_relation => { }
    assert_redirected_to column_relation_path(assigns(:column_relation))
  end

  test "should destroy column_relation" do
    assert_difference('ColumnRelation.count', -1) do
      delete :destroy, :id => column_relations(:one).to_param
    end

    assert_redirected_to column_relations_path
  end
end
