require 'test_helper'

class UserDashboardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_dashboard = user_dashboards(:one)
  end

  test "should get index" do
    get user_dashboards_url
    assert_response :success
  end

  test "should get new" do
    get new_user_dashboard_url
    assert_response :success
  end

  test "should create user_dashboard" do
    assert_difference('UserDashboard.count') do
      post user_dashboards_url, params: { user_dashboard: {  } }
    end

    assert_redirected_to user_dashboard_url(UserDashboard.last)
  end

  test "should show user_dashboard" do
    get user_dashboard_url(@user_dashboard)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_dashboard_url(@user_dashboard)
    assert_response :success
  end

  test "should update user_dashboard" do
    patch user_dashboard_url(@user_dashboard), params: { user_dashboard: {  } }
    assert_redirected_to user_dashboard_url(@user_dashboard)
  end

  test "should destroy user_dashboard" do
    assert_difference('UserDashboard.count', -1) do
      delete user_dashboard_url(@user_dashboard)
    end

    assert_redirected_to user_dashboards_url
  end
end
