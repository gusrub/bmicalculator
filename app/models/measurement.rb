class Measurement < ApplicationRecord
  belongs_to :User
  belongs_to :BmiRange
end
