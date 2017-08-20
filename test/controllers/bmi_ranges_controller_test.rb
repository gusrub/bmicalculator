require 'test_helper'

class BmiRangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bmi_range = bmi_ranges(:one)
  end

  test "should get index" do
    get bmi_ranges_url
    assert_response :success
  end

  test "should get new" do
    get new_bmi_range_url
    assert_response :success
  end

  test "should create bmi_range" do
    assert_difference('BmiRange.count') do
      post bmi_ranges_url, params: { bmi_range: { category: @bmi_range.category, lower_limit: @bmi_range.lower_limit, upper_limit: @bmi_range.upper_limit } }
    end

    assert_redirected_to bmi_range_url(BmiRange.last)
  end

  test "should show bmi_range" do
    get bmi_range_url(@bmi_range)
    assert_response :success
  end

  test "should get edit" do
    get edit_bmi_range_url(@bmi_range)
    assert_response :success
  end

  test "should update bmi_range" do
    patch bmi_range_url(@bmi_range), params: { bmi_range: { category: @bmi_range.category, lower_limit: @bmi_range.lower_limit, upper_limit: @bmi_range.upper_limit } }
    assert_redirected_to bmi_range_url(@bmi_range)
  end

  test "should destroy bmi_range" do
    assert_difference('BmiRange.count', -1) do
      delete bmi_range_url(@bmi_range)
    end

    assert_redirected_to bmi_ranges_url
  end
end
