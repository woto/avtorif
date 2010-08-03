require 'test_helper'

class ReceiveJobsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receive_jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receive_job" do
    assert_difference('ReceiveJob.count') do
      post :create, :receive_job => { }
    end

    assert_redirected_to receive_job_path(assigns(:receive_job))
  end

  test "should show receive_job" do
    get :show, :id => receive_jobs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => receive_jobs(:one).to_param
    assert_response :success
  end

  test "should update receive_job" do
    put :update, :id => receive_jobs(:one).to_param, :receive_job => { }
    assert_redirected_to receive_job_path(assigns(:receive_job))
  end

  test "should destroy receive_job" do
    assert_difference('ReceiveJob.count', -1) do
      delete :destroy, :id => receive_jobs(:one).to_param
    end

    assert_redirected_to receive_jobs_path
  end
end
