class Measurement < ApplicationRecord
  belongs_to :user
  belongs_to :bmi_range

  with_options presence: true do
    validates :user
    validates :bmi_range
  end
end
