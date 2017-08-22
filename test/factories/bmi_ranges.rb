FactoryGirl.define do
  factory :bmi_range do
    lower_limit { Faker::Number.between(0, 99.99) }
    upper_limit { Faker::Number.between(0, 99.99) }
    category do
      loop do
        sample = BmiRange.categories.keys.sample
        break sample unless BmiRange.exists?(category: sample)
      end
    end
    risk { BmiRange.risks.keys.sample }
  end
end
