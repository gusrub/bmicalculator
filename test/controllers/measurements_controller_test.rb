require 'test_helper'

class MeasurementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    ranges = create_list(:bmi_range, BmiRange.categories.keys.count)
    ranges.each do |range|
      create(:measurement, bmi_range: range)
    end
    @measurement = Measurement.last
    @new_measurement = build(:measurement)
    sign_in_valid_user
  end

  test "should get index" do
    get measurements_url
    assert_response :success
  end

  test "should create measurement" do
    assert_difference('Measurement.count') do
      post measurements_url, params: { format: :json, height: 187, weight: 81 }
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
