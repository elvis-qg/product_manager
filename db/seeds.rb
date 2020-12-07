# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


products_type = ["Hoodie", "Shoes"]
colors_hoodie = ["Red", "Blue", "Yellow", "Green"]
size_hoodie = ["S", "M", "L", "XL"]
colors_shoes = ["Red", "Brown", "Blue", "White"]
size_shoes = ["8", "9", "10", "11"]

products_type.each do |type|
  Type.create!(name: type)
end

colors_hoodie.each do |color|
  Color.create!(name: color, type_id: 1)
end

size_hoodie.each do |size|
  Size.create!(name: size, type_id: 1)
end

colors_shoes.each do |color|
  Color.create!(name: color, type_id:2)
end

size_shoes.each do |size|
  Size.create!(name: size, type_id: 2)
end
