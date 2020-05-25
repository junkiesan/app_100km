# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

puts "Destroy Users"
User.destroy_all
puts "Destroy Trips"
Trips.destroy_all
puts "Destroy Reviews"
Reviews.destroy_all
puts "Destroy Venues"
Venues.destroy_all

puts 'Creating user...'
10.times do
  users = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    )
  users.save!
  puts 'New user!'
end

test = User.create(name: 'Nemo', email: 'nemo@100km.com', password: 'helloworld')

trip = Trip.new(name: 'Hermit in the mountains 🏔', date: Date.now, user: nemo)
truck_1.save!
