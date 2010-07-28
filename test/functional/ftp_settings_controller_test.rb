require 'test_helper'

class FtpSettingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ftp_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ftp_setting" do
    assert_difference('FtpSetting.count') do
      post :create, :ftp_setting => { }
    end

    assert_redirected_to ftp_setting_path(assigns(:ftp_setting))
  end

  test "should show ftp_setting" do
    get :show, :id => ftp_settings(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ftp_settings(:one).to_param
    assert_response :success
  end

  test "should update ftp_setting" do
    put :update, :id => ftp_settings(:one).to_param, :ftp_setting => { }
    assert_redirected_to ftp_setting_path(assigns(:ftp_setting))
  end

  test "should destroy ftp_setting" do
    assert_difference('FtpSetting.count', -1) do
      delete :destroy, :id => ftp_settings(:one).to_param
    end

    assert_redirected_to ftp_settings_path
  end
end
