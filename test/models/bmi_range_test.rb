require 'test_helper'

class BmiRangeTest < ActiveSupport::TestCase

  def setup
    @bmi_range = build(:bmi_range)
  end

  test "range is valid with all info" do
    assert @bmi_range.valid?
  end

  test "validates lower limit" do
    validates_presence(:lower_limit)
    validates_numericality(:lower_limit, greater_than_or_equal_to: 0)
  end

  test "validates upper limit" do
    validates_presence(:upper_limit)
    validates_numericality(:upper_limit, greater_than_or_equal_to: 0)
  end

  test "validates category" do
    validates_presence(:category)
    validates_inclusion(:category, BmiRange.categories.keys)
    validates_uniqueness(:category, @bmi_range.category)
  end

end
