require 'test_helper'

class ReceiveFtpsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receive_ftps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receive_ftp" do
    assert_difference('ReceiveFtp.count') do
      post :create, :receive_ftp => { }
    end

    assert_redirected_to receive_ftp_path(assigns(:receive_ftp))
  end

  test "should show receive_ftp" do
    get :show, :id => receive_ftps(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => receive_ftps(:one).to_param
    assert_response :success
  end

  test "should update receive_ftp" do
    put :update, :id => receive_ftps(:one).to_param, :receive_ftp => { }
    assert_redirected_to receive_ftp_path(assigns(:receive_ftp))
  end

  test "should destroy receive_ftp" do
    assert_difference('ReceiveFtp.count', -1) do
      delete :destroy, :id => receive_ftps(:one).to_param
    end

    assert_redirected_to receive_ftps_path
  end
end
