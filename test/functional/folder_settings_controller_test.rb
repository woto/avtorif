require 'test_helper'

class FolderSettingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:folder_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create folder_setting" do
    assert_difference('FolderSetting.count') do
      post :create, :folder_setting => { }
    end

    assert_redirected_to folder_setting_path(assigns(:folder_setting))
  end

  test "should show folder_setting" do
    get :show, :id => folder_settings(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => folder_settings(:one).to_param
    assert_response :success
  end

  test "should update folder_setting" do
    put :update, :id => folder_settings(:one).to_param, :folder_setting => { }
    assert_redirected_to folder_setting_path(assigns(:folder_setting))
  end

  test "should destroy folder_setting" do
    assert_difference('FolderSetting.count', -1) do
      delete :destroy, :id => folder_settings(:one).to_param
    end

    assert_redirected_to folder_settings_path
  end
end
