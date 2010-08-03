require 'test_helper'

class ImportExcelsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:import_excels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create import_excel" do
    assert_difference('ImportExcel.count') do
      post :create, :import_excel => { }
    end

    assert_redirected_to import_excel_path(assigns(:import_excel))
  end

  test "should show import_excel" do
    get :show, :id => import_excels(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => import_excels(:one).to_param
    assert_response :success
  end

  test "should update import_excel" do
    put :update, :id => import_excels(:one).to_param, :import_excel => { }
    assert_redirected_to import_excel_path(assigns(:import_excel))
  end

  test "should destroy import_excel" do
    assert_difference('ImportExcel.count', -1) do
      delete :destroy, :id => import_excels(:one).to_param
    end

    assert_redirected_to import_excels_path
  end
end
