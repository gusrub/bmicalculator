class BmiRange < ApplicationRecord

  include Concerns::Paginable

  enum category: {
    very_severely_underweight: 0,
    severely_underweight: 1,
    underweight: 2,
    normal: 3,
    overweight: 4,
    obese_class_1: 5,
    obese_class_2: 6,
    obese_class_3: 7
  }

  enum risk: {
    normal_risk: 0,
    average_risk: 1,
    important_risk: 2,
    severe_risk: 3
  }

  with_options presence: true, numericality: { greater_than_or_equal_to: 0 } do
    validates :upper_limit
    validates :lower_limit
  end

  validates :category, presence: true, inclusion: { in: self.categories.keys }, uniqueness: true

  scope :search, ->(term) {
    where(category: BmiRange.categories.find_all {|cat| cat[0] =~ /#{term.downcase}/}.to_h.values)
  }

end
