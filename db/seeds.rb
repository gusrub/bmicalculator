# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  { category: 'very_severely_underweight', lower_limit: 0, upper_limit: 14.99 },
  { category: 'severely_underweight', lower_limit: 15, upper_limit: 15.99 },
  { category: 'underweight', lower_limit: 16, upper_limit: 18.49 },
  { category: 'normal', lower_limit: 18.5, upper_limit: 24.99 },
  { category: 'overweight', lower_limit: 25, upper_limit: 29.99 },
  { category: 'obese_class_1', lower_limit: 30, upper_limit: 34.99 },
  { category: 'obese_class_2', lower_limit: 35, upper_limit: 39.99 },
  { category: 'obese_class_3', lower_limit: 40, upper_limit: 999 }
].each do |bmi_range|
  BmiRange.create!(category: BmiRange.categories[bmi_range[:category]], lower_limit: bmi_range[:lower_limit], upper_limit: bmi_range[:upper_limit])
end