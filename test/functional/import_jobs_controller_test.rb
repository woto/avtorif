require 'test_helper'

class ImportJobsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:import_jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create import_job" do
    assert_difference('ImportJob.count') do
      post :create, :import_job => { }
    end

    assert_redirected_to import_job_path(assigns(:import_job))
  end

  test "should show import_job" do
    get :show, :id => import_jobs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => import_jobs(:one).to_param
    assert_response :success
  end

  test "should update import_job" do
    put :update, :id => import_jobs(:one).to_param, :import_job => { }
    assert_redirected_to import_job_path(assigns(:import_job))
  end

  test "should destroy import_job" do
    assert_difference('ImportJob.count', -1) do
      delete :destroy, :id => import_jobs(:one).to_param
    end

    assert_redirected_to import_jobs_path
  end
end
