require "application_system_test_case"

class SleepsTest < ApplicationSystemTestCase
  setup do
    @sleep = sleeps(:one)
  end

  test "visiting the index" do
    visit sleeps_url
    assert_selector "h1", text: "Sleeps"
  end

  test "creating a Sleep" do
    visit sleeps_url
    click_on "New Sleep"

    fill_in "Date", with: @sleep.date
    fill_in "Hrs", with: @sleep.hrs
    fill_in "Mins", with: @sleep.mins
    fill_in "Total hrs", with: @sleep.total_hrs
    fill_in "Total mins", with: @sleep.total_mins
    click_on "Create Sleep"

    assert_text "Sleep was successfully created"
    click_on "Back"
  end

  test "updating a Sleep" do
    visit sleeps_url
    click_on "Edit", match: :first

    fill_in "Date", with: @sleep.date
    fill_in "Hrs", with: @sleep.hrs
    fill_in "Mins", with: @sleep.mins
    fill_in "Total hrs", with: @sleep.total_hrs
    fill_in "Total mins", with: @sleep.total_mins
    click_on "Update Sleep"

    assert_text "Sleep was successfully updated"
    click_on "Back"
  end

  test "destroying a Sleep" do
    visit sleeps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sleep was successfully destroyed"
  end
end
