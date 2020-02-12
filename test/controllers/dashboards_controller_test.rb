require 'test_helper'

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get scratch" do
    get dashboards_scratch_url
    assert_response :success
  end

  test "should get exercise" do
    get dashboards_exercise_url
    assert_response :success
  end

  test "should get consumption" do
    get dashboards_consumption_url
    assert_response :success
  end

  test "should get daily_habits" do
    get dashboards_daily_habits_url
    assert_response :success
  end

  test "should get sleep" do
    get dashboards_sleep_url
    assert_response :success
  end

end
