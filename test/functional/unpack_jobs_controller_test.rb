require 'test_helper'

class UnpackJobsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unpack_jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unpack_job" do
    assert_difference('UnpackJob.count') do
      post :create, :unpack_job => { }
    end

    assert_redirected_to unpack_job_path(assigns(:unpack_job))
  end

  test "should show unpack_job" do
    get :show, :id => unpack_jobs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => unpack_jobs(:one).to_param
    assert_response :success
  end

  test "should update unpack_job" do
    put :update, :id => unpack_jobs(:one).to_param, :unpack_job => { }
    assert_redirected_to unpack_job_path(assigns(:unpack_job))
  end

  test "should destroy unpack_job" do
    assert_difference('UnpackJob.count', -1) do
      delete :destroy, :id => unpack_jobs(:one).to_param
    end

    assert_redirected_to unpack_jobs_path
  end
end
