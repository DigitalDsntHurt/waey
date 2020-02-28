require "application_system_test_case"

class HrvsTest < ApplicationSystemTestCase
  setup do
    @hrv = hrvs(:one)
  end

  test "visiting the index" do
    visit hrvs_url
    assert_selector "h1", text: "Hrvs"
  end

  test "creating a Hrv" do
    visit hrvs_url
    click_on "New Hrv"

    fill_in "Date", with: @hrv.date
    fill_in "Hrv", with: @hrv.hrv
    click_on "Create Hrv"

    assert_text "Hrv was successfully created"
    click_on "Back"
  end

  test "updating a Hrv" do
    visit hrvs_url
    click_on "Edit", match: :first

    fill_in "Date", with: @hrv.date
    fill_in "Hrv", with: @hrv.hrv
    click_on "Update Hrv"

    assert_text "Hrv was successfully updated"
    click_on "Back"
  end

  test "destroying a Hrv" do
    visit hrvs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hrv was successfully destroyed"
  end
end
