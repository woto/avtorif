require 'test_helper'

class RepeatsJobsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:repeats_jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create repeats_job" do
    assert_difference('RepeatsJob.count') do
      post :create, :repeats_job => { }
    end

    assert_redirected_to repeats_job_path(assigns(:repeats_job))
  end

  test "should show repeats_job" do
    get :show, :id => repeats_jobs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => repeats_jobs(:one).to_param
    assert_response :success
  end

  test "should update repeats_job" do
    put :update, :id => repeats_jobs(:one).to_param, :repeats_job => { }
    assert_redirected_to repeats_job_path(assigns(:repeats_job))
  end

  test "should destroy repeats_job" do
    assert_difference('RepeatsJob.count', -1) do
      delete :destroy, :id => repeats_jobs(:one).to_param
    end

    assert_redirected_to repeats_jobs_path
  end
end
