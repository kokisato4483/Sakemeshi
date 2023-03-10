# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email: "a@a", password: "123456")

50.times do |n|
    Customer.create(
        name: "#{n}",
        email: "#{n}@#{n}",
        password: "123456",
    )
end

30.times do |n|
    Recipe.create!(
        customer_id: 2,
        genre_id: 4,
        name: "#{n}",
        description: "#{n}",
        tips: "#{n}",
        point: "#{n}",
        drink: "#{n}",
        drink_point: "#{n}",
    )
end