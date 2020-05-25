# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'
require 'open-uri'
require "json"
require 'rest-client'

# puts "Destroy Users"
# User.destroy_all
# puts "Destroy Trips"
# Trips.destroy_all
# puts "Destroy Reviews"
# Reviews.destroy_all
# puts "Destroy Venues"
# Venues.destroy_all

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

# trip = Trip.new(name: 'Hermit in the mountains 🏔', date: Date.now, user: nemo)
# truck_1.save!

response = RestClient.get "https://api.foursquare.com/v2/venues/search?ll=48.8566969,2.3514616&client_id=PKECGHIH201FYP4DKCUB4IC2RG0AEPAFICVKMBLFO1XXLNMN&client_secret=EP215GIGFV11TDBDZDZLFI1V3ZDQ2RDZWOGV5UCTGKKXIZDW&v=20202005&categoryId=4bf58dd8d48988d181941735"
repos = JSON.parse(response)
repos["response"]["venues"].each do |venue|
  Venue.create!(
      name: venue["name"],
      lattitude: venue["location"]["lat"],
      longitude: venue["location"]["lng"],
      zip: venue["postalCode"],
      category: venue["categories"]["name"],
      address: venue["formattedAddress"][0],
    )
end
