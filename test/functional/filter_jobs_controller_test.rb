require 'test_helper'

class FilterJobsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:filter_jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create filter_job" do
    assert_difference('FilterJob.count') do
      post :create, :filter_job => { }
    end

    assert_redirected_to filter_job_path(assigns(:filter_job))
  end

  test "should show filter_job" do
    get :show, :id => filter_jobs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => filter_jobs(:one).to_param
    assert_response :success
  end

  test "should update filter_job" do
    put :update, :id => filter_jobs(:one).to_param, :filter_job => { }
    assert_redirected_to filter_job_path(assigns(:filter_job))
  end

  test "should destroy filter_job" do
    assert_difference('FilterJob.count', -1) do
      delete :destroy, :id => filter_jobs(:one).to_param
    end

    assert_redirected_to filter_jobs_path
  end
end
