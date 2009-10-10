require 'test_helper'

class CoursesRegistrationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses_registrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create courses_registration" do
    assert_difference('CoursesRegistration.count') do
      post :create, :courses_registration => { }
    end

    assert_redirected_to courses_registration_path(assigns(:courses_registration))
  end

  test "should show courses_registration" do
    get :show, :id => courses_registrations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => courses_registrations(:one).to_param
    assert_response :success
  end

  test "should update courses_registration" do
    put :update, :id => courses_registrations(:one).to_param, :courses_registration => { }
    assert_redirected_to courses_registration_path(assigns(:courses_registration))
  end

  test "should destroy courses_registration" do
    assert_difference('CoursesRegistration.count', -1) do
      delete :destroy, :id => courses_registrations(:one).to_param
    end

    assert_redirected_to courses_registrations_path
  end
end
