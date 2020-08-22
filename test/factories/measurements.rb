FactoryBot.define do
  factory :measurement do
    user
    bmi_range do
      BmiRange.first || create(:bmi_range)
    end
  end
end
