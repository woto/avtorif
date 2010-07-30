require 'test_helper'

class FtpsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ftps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ftp" do
    assert_difference('Ftp.count') do
      post :create, :ftp => { }
    end

    assert_redirected_to ftp_path(assigns(:ftp))
  end

  test "should show ftp" do
    get :show, :id => ftps(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ftps(:one).to_param
    assert_response :success
  end

  test "should update ftp" do
    put :update, :id => ftps(:one).to_param, :ftp => { }
    assert_redirected_to ftp_path(assigns(:ftp))
  end

  test "should destroy ftp" do
    assert_difference('Ftp.count', -1) do
      delete :destroy, :id => ftps(:one).to_param
    end

    assert_redirected_to ftps_path
  end
end
