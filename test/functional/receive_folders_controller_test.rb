require 'test_helper'

class ReceiveFoldersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receive_folders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receive_folder" do
    assert_difference('ReceiveFolder.count') do
      post :create, :receive_folder => { }
    end

    assert_redirected_to receive_folder_path(assigns(:receive_folder))
  end

  test "should show receive_folder" do
    get :show, :id => receive_folders(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => receive_folders(:one).to_param
    assert_response :success
  end

  test "should update receive_folder" do
    put :update, :id => receive_folders(:one).to_param, :receive_folder => { }
    assert_redirected_to receive_folder_path(assigns(:receive_folder))
  end

  test "should destroy receive_folder" do
    assert_difference('ReceiveFolder.count', -1) do
      delete :destroy, :id => receive_folders(:one).to_param
    end

    assert_redirected_to receive_folders_path
  end
end
