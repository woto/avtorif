require 'test_helper'

class ConvertJobsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:convert_jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create convert_job" do
    assert_difference('ConvertJob.count') do
      post :create, :convert_job => { }
    end

    assert_redirected_to convert_job_path(assigns(:convert_job))
  end

  test "should show convert_job" do
    get :show, :id => convert_jobs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => convert_jobs(:one).to_param
    assert_response :success
  end

  test "should update convert_job" do
    put :update, :id => convert_jobs(:one).to_param, :convert_job => { }
    assert_redirected_to convert_job_path(assigns(:convert_job))
  end

  test "should destroy convert_job" do
    assert_difference('ConvertJob.count', -1) do
      delete :destroy, :id => convert_jobs(:one).to_param
    end

    assert_redirected_to convert_jobs_path
  end
end
