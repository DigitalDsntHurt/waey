require 'test_helper'

class HrvsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hrv = hrvs(:one)
  end

  test "should get index" do
    get hrvs_url
    assert_response :success
  end

  test "should get new" do
    get new_hrv_url
    assert_response :success
  end

  test "should create hrv" do
    assert_difference('Hrv.count') do
      post hrvs_url, params: { hrv: { date: @hrv.date, hrv: @hrv.hrv } }
    end

    assert_redirected_to hrv_url(Hrv.last)
  end

  test "should show hrv" do
    get hrv_url(@hrv)
    assert_response :success
  end

  test "should get edit" do
    get edit_hrv_url(@hrv)
    assert_response :success
  end

  test "should update hrv" do
    patch hrv_url(@hrv), params: { hrv: { date: @hrv.date, hrv: @hrv.hrv } }
    assert_redirected_to hrv_url(@hrv)
  end

  test "should destroy hrv" do
    assert_difference('Hrv.count', -1) do
      delete hrv_url(@hrv)
    end

    assert_redirected_to hrvs_url
  end
end
