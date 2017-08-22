# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  { category: 'very_severely_underweight', lower_limit: 0, upper_limit: 14.99, risk: 'severe_risk' },
  { category: 'severely_underweight', lower_limit: 15, upper_limit: 15.99, risk: 'important_risk' },
  { category: 'underweight', lower_limit: 16, upper_limit: 18.49, risk: 'average_risk' },
  { category: 'normal', lower_limit: 18.5, upper_limit: 24.99, risk: 'normal_risk' },
  { category: 'overweight', lower_limit: 25, upper_limit: 29.99, risk: 'average_risk' },
  { category: 'obese_class_1', lower_limit: 30, upper_limit: 34.99, risk: 'important_risk' },
  { category: 'obese_class_2', lower_limit: 35, upper_limit: 39.99, risk: 'severe_risk' },
  { category: 'obese_class_3', lower_limit: 40, upper_limit: 999, risk: 'severe_risk' }
].each do |bmi_range|
  BmiRange.create!(category: BmiRange.categories[bmi_range[:category]], risk: BmiRange.risks[bmi_range[:risk]], lower_limit: bmi_range[:lower_limit], upper_limit: bmi_range[:upper_limit])
end

[
  { email: "jakob@example.com", first_name: "Jakob", last_name: "Dylan", dob: "1969-09-12", gender: "male", role: "visitor", password: "Testing@123!", password_confirmation: "Testing@123!" },
  { email: "trent@example.com", first_name: "Trent", last_name: "Reznor", dob: "1965-05-17", gender: "male", role: "visitor", password: "Testing@123!", password_confirmation: "Testing@123!" },
  { email: "noel@example.com", first_name: "Noel", last_name: "Gallagher", dob: "1967-05-29", gender: "male", role: "visitor", password: "Testing@123!", password_confirmation: "Testing@123!" },
  { email: "shirley@example.com", first_name: "Shirley", last_name: "Manson", dob: "1966-08-26", gender: "male", role: "visitor", password: "Testing@123!", password_confirmation: "Testing@123!" },
  { email: "eddie@example.com", first_name: "Eddie", last_name: "Vedder", dob: "1964-12-23", gender: "male", role: "visitor", password: "Testing@123!", password_confirmation: "Testing@123!" },
  { email: "bruce@example.com", first_name: "Bruce", last_name: "Springsteen", dob: "1949-09-23", gender: "male", role: "visitor", password: "Testing@123!", password_confirmation: "Testing@123!" },
  { email: "gustavo.rubio@gmail.com", first_name: "Gustavo", last_name: "Rubio", dob: "1985-06-19", gender: "male", role: "admin", password: "Testing@123!", password_confirmation: "Testing@123!" }
].each do |user_params|
  user = User.new(user_params)
  user.skip_confirmation!
  user.save!
end
