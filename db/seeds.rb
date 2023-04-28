# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email: "test@gmail.com", password: "123456")

10.times do |n|
    Customer.create(
        name: "#{n}",
        email: "#{n}@#{n}",
        password: "123456",
    )
end

10.times do |n|
    Recipe.find_or_create_by(
        customer_id: "#{n}",
        genre_id: "#{n}",
        name: "#{n}",
        description: "#{n}",
        tips: "#{n}",
        point: "#{n}",
        drink: "#{n}",
        drink_point: "#{n}",
    )
end

Recipeag.create([
  { name: 'タグ1' },
  { name: 'タグ2' },
  { name: 'タグ3' },
  { name: 'タグ4' },
  { name: 'タグ5' }
])