require 'test_helper'

class MeasurementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    ranges = create_list(:bmi_range, BmiRange.categories.keys.count)
    ranges.each do |range|
      create(:measurement, bmi_range: range)
    end
    @measurement = Measurement.last
    @new_measurement = build(:measurement)
  end

  test "should get index" do
    get measurements_url
    assert_response :success
  end

  test "should get new" do
    get new_measurement_url
    assert_response :success
  end

  test "should create measurement" do
    assert_difference('Measurement.count') do
      post measurements_url, params: { measurement: { bmi_range_id: @new_measurement.bmi_range_id, user_id: @new_measurement.user_id } }
    end

    assert_redirected_to measurement_url(Measurement.last)
  end

  test "should show measurement" do
    get measurement_url(@measurement)
    assert_response :success
  end

  test "should get edit" do
    get edit_measurement_url(@measurement)
    assert_response :success
  end

  test "should update measurement" do
    patch measurement_url(@measurement), params: { measurement: { bmi_range_id: @measurement.bmi_range_id, user_id: @measurement.user_id } }
    assert_redirected_to measurement_url(@measurement)
  end

  test "should destroy measurement" do
    assert_difference('Measurement.count', -1) do
      delete measurement_url(@measurement)
    end

    assert_redirected_to measurements_url
  end
end
