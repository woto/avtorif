require 'test_helper'

class ReceiveEmailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receive_emails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receive_email" do
    assert_difference('ReceiveEmail.count') do
      post :create, :receive_email => { }
    end

    assert_redirected_to receive_email_path(assigns(:receive_email))
  end

  test "should show receive_email" do
    get :show, :id => receive_emails(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => receive_emails(:one).to_param
    assert_response :success
  end

  test "should update receive_email" do
    put :update, :id => receive_emails(:one).to_param, :receive_email => { }
    assert_redirected_to receive_email_path(assigns(:receive_email))
  end

  test "should destroy receive_email" do
    assert_difference('ReceiveEmail.count', -1) do
      delete :destroy, :id => receive_emails(:one).to_param
    end

    assert_redirected_to receive_emails_path
  end
end
