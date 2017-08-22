class Measurement < ApplicationRecord

  include Concerns::Paginable

  belongs_to :user
  belongs_to :bmi_range

  with_options presence: true do
    validates :user
    validates :bmi_range
  end

  scope :search, ->(term) {
    joins(:bmi_range).where(bmi_ranges: { category: BmiRange.categories.find_all {|cat| cat[0] =~ /#{term.downcase}/}.to_h.values})
  }
end
