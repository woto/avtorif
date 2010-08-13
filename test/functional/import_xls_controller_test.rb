require 'test_helper'

class ImportXlsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:import_xls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create import_xl" do
    assert_difference('ImportXl.count') do
      post :create, :import_xl => { }
    end

    assert_redirected_to import_xl_path(assigns(:import_xl))
  end

  test "should show import_xl" do
    get :show, :id => import_xls(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => import_xls(:one).to_param
    assert_response :success
  end

  test "should update import_xl" do
    put :update, :id => import_xls(:one).to_param, :import_xl => { }
    assert_redirected_to import_xl_path(assigns(:import_xl))
  end

  test "should destroy import_xl" do
    assert_difference('ImportXl.count', -1) do
      delete :destroy, :id => import_xls(:one).to_param
    end

    assert_redirected_to import_xls_path
  end
end
