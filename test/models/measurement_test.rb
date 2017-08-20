require 'test_helper'

class MeasurementTest < ActiveSupport::TestCase

  def setup
    @measurement = build(:measurement)
  end

  test "measurement is valid with all info" do
    assert @measurement.valid?
  end

  test "validates user" do
    validates_presence(:user)
    validates_belongs_to(:user)
  end

  test "validates BMI range" do
    validates_presence(:bmi_range)
    validates_belongs_to(:user)
  end

end
