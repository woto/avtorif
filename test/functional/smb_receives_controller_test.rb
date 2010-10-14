require 'test_helper'

class SmbReceivesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smb_receives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smb_receive" do
    assert_difference('SmbReceive.count') do
      post :create, :smb_receive => { }
    end

    assert_redirected_to smb_receive_path(assigns(:smb_receive))
  end

  test "should show smb_receive" do
    get :show, :id => smb_receives(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => smb_receives(:one).to_param
    assert_response :success
  end

  test "should update smb_receive" do
    put :update, :id => smb_receives(:one).to_param, :smb_receive => { }
    assert_redirected_to smb_receive_path(assigns(:smb_receive))
  end

  test "should destroy smb_receive" do
    assert_difference('SmbReceive.count', -1) do
      delete :destroy, :id => smb_receives(:one).to_param
    end

    assert_redirected_to smb_receives_path
  end
end
