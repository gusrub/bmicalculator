FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { Faker::Internet.password }
    dob { Faker::Date.birthday }
    gender { User.genders.keys.sample }
    role { User.roles.keys.sample }
    picture { nil }

    factory :user_with_measurements do
      transient do
        measurements_count { 3 }
      end

      after_create do |user, evaluator|
        create_list(:measurement, measurements_count, user: user)
      end
    end
  end
end
