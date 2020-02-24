require 'test_helper'

class ReviewControllerTest < ActionDispatch::IntegrationTest
  test "should get this_week" do
    get review_this_week_url
    assert_response :success
  end

  test "should get last_week" do
    get review_last_week_url
    assert_response :success
  end

  test "should get trailing_seven_days" do
    get review_trailing_seven_days_url
    assert_response :success
  end

end
