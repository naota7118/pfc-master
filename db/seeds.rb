# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
  User.create!(
    name: "testname#{n + 6}",
    email: "test#{n + 6}@test.com",
    password: "password#{n + 6}"
  )
end

5.times do |n|
  Post.create!(
    food: "curry",
    calorie: 500,
    protein: 100,
    fat: 100,
    carbo: 100,
    text: "カレーを食べました",
    user_id: "#{n + 6}",
    weight: 70
  )
end

5.times do |n|
  Standard.create!(
    weight: 70,
    calorie: 2240,
    protein: 140,
    fat: 50,
    carbo: 308,
    user_id: "#{n + 1}",
    bodyFatPercentage: 20,
    leanBodyMass: 56
  )
end
