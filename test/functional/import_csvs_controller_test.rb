require 'test_helper'

class ImportCsvsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:import_csvs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create import_csv" do
    assert_difference('ImportCsv.count') do
      post :create, :import_csv => { }
    end

    assert_redirected_to import_csv_path(assigns(:import_csv))
  end

  test "should show import_csv" do
    get :show, :id => import_csvs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => import_csvs(:one).to_param
    assert_response :success
  end

  test "should update import_csv" do
    put :update, :id => import_csvs(:one).to_param, :import_csv => { }
    assert_redirected_to import_csv_path(assigns(:import_csv))
  end

  test "should destroy import_csv" do
    assert_difference('ImportCsv.count', -1) do
      delete :destroy, :id => import_csvs(:one).to_param
    end

    assert_redirected_to import_csvs_path
  end
end
