require 'test_helper'

class MeasurementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @height = 187
    @weight = 81
    ranges = create_list(:bmi_range, BmiRange.categories.keys.count)
    ranges.last.update_attributes(lower_limit: 20.0, upper_limit: 30.0)
    user = create(:user)
    sign_in_valid_user(user)
    ranges.each do |range|
      create(:measurement, bmi_range: range, user: user)
    end
    @measurement = user.measurements.last
  end

  test "should get index" do
    get measurements_url
    assert_response :success
  end

  test "should create measurement" do
    assert_difference('Measurement.count') do
      post measurements_url, params: { format: :json, height: @height, weight: @weight }
    end

    assert_response :success
  end

  test "should show measurement" do
    get measurement_url(@measurement), params: { format: :json }
    assert_response :success
  end

  test "should destroy measurement" do
    assert_difference('Measurement.count', -1) do
      delete measurement_url(@measurement)
    end

    assert_redirected_to measurements_url
  end
end
