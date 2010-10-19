require 'test_helper'

class FtpReceivesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ftp_receives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ftp_receive" do
    assert_difference('FtpReceive.count') do
      post :create, :ftp_receive => { }
    end

    assert_redirected_to ftp_receive_path(assigns(:ftp_receive))
  end

  test "should show ftp_receive" do
    get :show, :id => ftp_receives(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ftp_receives(:one).to_param
    assert_response :success
  end

  test "should update ftp_receive" do
    put :update, :id => ftp_receives(:one).to_param, :ftp_receive => { }
    assert_redirected_to ftp_receive_path(assigns(:ftp_receive))
  end

  test "should destroy ftp_receive" do
    assert_difference('FtpReceive.count', -1) do
      delete :destroy, :id => ftp_receives(:one).to_param
    end

    assert_redirected_to ftp_receives_path
  end
end
