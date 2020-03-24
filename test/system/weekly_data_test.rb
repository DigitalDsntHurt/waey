require "application_system_test_case"

class WeeklyDataTest < ApplicationSystemTestCase
  setup do
    @weekly_datum = weekly_data(:one)
  end

  test "visiting the index" do
    visit weekly_data_url
    assert_selector "h1", text: "Weekly Data"
  end

  test "creating a Weekly datum" do
    visit weekly_data_url
    click_on "New Weekly Datum"

    fill_in "Am brush days", with: @weekly_datum.am_brush_days
    fill_in "Exercise days", with: @weekly_datum.exercise_days
    fill_in "Journal days", with: @weekly_datum.journal_days
    fill_in "Meditation days", with: @weekly_datum.meditation_days
    fill_in "No alcohol days", with: @weekly_datum.no_alcohol_days
    fill_in "Pm brush days", with: @weekly_datum.pm_brush_days
    fill_in "Shower days", with: @weekly_datum.shower_days
    fill_in "Total sleep hours", with: @weekly_datum.total_sleep_hours
    fill_in "Week of", with: @weekly_datum.week_of
    fill_in "Winning consumption days", with: @weekly_datum.winning_consumption_days
    click_on "Create Weekly datum"

    assert_text "Weekly datum was successfully created"
    click_on "Back"
  end

  test "updating a Weekly datum" do
    visit weekly_data_url
    click_on "Edit", match: :first

    fill_in "Am brush days", with: @weekly_datum.am_brush_days
    fill_in "Exercise days", with: @weekly_datum.exercise_days
    fill_in "Journal days", with: @weekly_datum.journal_days
    fill_in "Meditation days", with: @weekly_datum.meditation_days
    fill_in "No alcohol days", with: @weekly_datum.no_alcohol_days
    fill_in "Pm brush days", with: @weekly_datum.pm_brush_days
    fill_in "Shower days", with: @weekly_datum.shower_days
    fill_in "Total sleep hours", with: @weekly_datum.total_sleep_hours
    fill_in "Week of", with: @weekly_datum.week_of
    fill_in "Winning consumption days", with: @weekly_datum.winning_consumption_days
    click_on "Update Weekly datum"

    assert_text "Weekly datum was successfully updated"
    click_on "Back"
  end

  test "destroying a Weekly datum" do
    visit weekly_data_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Weekly datum was successfully destroyed"
  end
end
