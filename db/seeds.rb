# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'
require "json"
require 'rest-client'
puts "Destroy Users"
User.destroy_all
# puts "Destroy Trips"
# Trip.destroy_all
# puts "Destroy Reviews"
# Review.destroy_all
puts "Destroy Venues"
Venue.destroy_all
# puts 'Creating user...'
# 10.times do
#   users = User.new(
#     name: Faker::Name.name,
#     email: Faker::Internet.email,
#     password: "mdpmdp",
#     )
#   users.save!
#   puts 'New user!'
# end
test = User.create(name: 'Nemo', email: 'nemo@100km.com', password: 'helloworld')


CITIES = ['Paris', 'Lyon', 'Marseille', 'Bordeaux'] # => Add Cities
CATEGORIES = ['Musee', 'Parc', 'Plage', 'Monument'] # => Add Categories
CITIES.each do |city|
  puts "Fetching: #{city}"
  CATEGORIES.each do |category|
    puts "-- Cateogry: #{category}"
    response = RestClient.get "https://api.foursquare.com/v2/venues/search?near=#{city},France&client_id=PKECGHIH201FYP4DKCUB4IC2RG0AEPAFICVKMBLFO1XXLNMN&client_secret=EP215GIGFV11TDBDZDZLFI1V3ZDQ2RDZWOGV5UCTGKKXIZDW&v=20202005&query=#{category}&locale=fr"
    data = JSON.parse(response)
    data["response"]["venues"].each do |venue|
      if venue['categories'].any?
        Venue.create!(
          name: venue['name'],
          latitude: venue['location']['lat'],
          longitude: venue['location']['lng'],
          zip: venue['location']['postalCode'],
          category: venue['categories'].first['name'],
          address: venue['location']['formattedAddress'][0]
        )
      end
    end
  end
end
