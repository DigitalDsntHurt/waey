require 'test_helper'

class WeeklyDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weekly_datum = weekly_data(:one)
  end

  test "should get index" do
    get weekly_data_url
    assert_response :success
  end

  test "should get new" do
    get new_weekly_datum_url
    assert_response :success
  end

  test "should create weekly_datum" do
    assert_difference('WeeklyDatum.count') do
      post weekly_data_url, params: { weekly_datum: { am_brush_days: @weekly_datum.am_brush_days, exercise_days: @weekly_datum.exercise_days, journal_days: @weekly_datum.journal_days, meditation_days: @weekly_datum.meditation_days, no_alcohol_days: @weekly_datum.no_alcohol_days, pm_brush_days: @weekly_datum.pm_brush_days, shower_days: @weekly_datum.shower_days, total_sleep_hours: @weekly_datum.total_sleep_hours, week_of: @weekly_datum.week_of, winning_consumption_days: @weekly_datum.winning_consumption_days } }
    end

    assert_redirected_to weekly_datum_url(WeeklyDatum.last)
  end

  test "should show weekly_datum" do
    get weekly_datum_url(@weekly_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_weekly_datum_url(@weekly_datum)
    assert_response :success
  end

  test "should update weekly_datum" do
    patch weekly_datum_url(@weekly_datum), params: { weekly_datum: { am_brush_days: @weekly_datum.am_brush_days, exercise_days: @weekly_datum.exercise_days, journal_days: @weekly_datum.journal_days, meditation_days: @weekly_datum.meditation_days, no_alcohol_days: @weekly_datum.no_alcohol_days, pm_brush_days: @weekly_datum.pm_brush_days, shower_days: @weekly_datum.shower_days, total_sleep_hours: @weekly_datum.total_sleep_hours, week_of: @weekly_datum.week_of, winning_consumption_days: @weekly_datum.winning_consumption_days } }
    assert_redirected_to weekly_datum_url(@weekly_datum)
  end

  test "should destroy weekly_datum" do
    assert_difference('WeeklyDatum.count', -1) do
      delete weekly_datum_url(@weekly_datum)
    end

    assert_redirected_to weekly_data_url
  end
end
