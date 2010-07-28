require 'test_helper'

class EmailSettingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:email_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create email_setting" do
    assert_difference('EmailSetting.count') do
      post :create, :email_setting => { }
    end

    assert_redirected_to email_setting_path(assigns(:email_setting))
  end

  test "should show email_setting" do
    get :show, :id => email_settings(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => email_settings(:one).to_param
    assert_response :success
  end

  test "should update email_setting" do
    put :update, :id => email_settings(:one).to_param, :email_setting => { }
    assert_redirected_to email_setting_path(assigns(:email_setting))
  end

  test "should destroy email_setting" do
    assert_difference('EmailSetting.count', -1) do
      delete :destroy, :id => email_settings(:one).to_param
    end

    assert_redirected_to email_settings_path
  end
end
