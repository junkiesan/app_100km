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
require 'open-uri'

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
    puts "-- Category: #{category}"
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

puts 'Creating venues...'

venue_1 = Venue.new(name: 'Fondation Claude Monet', latitude: '48.8656', longitude: '2.3789894', zip: '27620', category: 'Monument', address: '84 Rue Claude Monet, 27620 Giverny')
file = URI.open('https://lh3.googleusercontent.com/proxy/k81Cnh17dA3yW1a4Gx0pHIkOguBRvjhkkyf3MRS4aoJ5b6HFQi-EyQSzfnC6OczFQpQdQmKVNQfmoNVo4q7vu7uVXtOGchJ0ckT_HS9R3IiweiO5Y3sxXbnwSrbjy7rKLp90knocHJXZWGSQkADwndAP6vWYo-J7Xz95kpU')
venue_1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_1.save!

venue_2 = Venue.new(name: 'Musée des impressionnismes', latitude: '49.0763478', longitude: '1.5313261', zip: '27620', category: 'Musee', address: '99 Rue Claude Monet, 27620 Giverny')
file = URI.open('https://www.aleou.fr/images/etablissements/2728/max/img_5278_7324.jpg')
venue_2.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_2.save!

venue_3 = Venue.new(name: 'Musée de Mécanique Naturelle', latitude: '49.0772245', longitude: '1.5300958', zip: '27620', category: 'Musee', address: '2 Rue Blanche Hoschede Monet, 27620 Giverny')
file = URI.open('https://media-cdn.tripadvisor.com/media/photo-s/08/63/ee/14/musee-de-mecanique-naturelle.jpg')
venue_3.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_3.save!

venue_4 = Venue.new(name: 'Église Sainte-Radegonde de Giverny', latitude: '49.0779473', longitude: '1.522953', zip: '27620', category: 'Monument', address: '53 Rue Claude Monet, 27620 Giverny')
file = URI.open('https://www.justacote.com/photos_entreprises/eglise-sainte-radegonde-giverny-14325309030.jpg')
venue_4.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_4.save!

venue_5 = Venue.new(name: 'Forêt domaniale de Meudon', latitude: '48.8008072', longitude: '2.2108289', zip: '92360', category: 'Parc', address: 'Forêt domaniale de Meudon, 92360 Meudon')
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/f/f3/EtangVillebon.jpg')
venue_5.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_5.save!

puts 'Creating venues...'
venue_6 = Venue.new(name: 'Château de Versailles', latitude: '48.8', longitude: '2.1333', zip: '78000', category: 'Monuments historiques', address: "Place d'Armes, 78000 Versailles")
file = URI.open('data:image/jpeg;base64,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')
venue_6.photo.attach(io: file, filename: 'versailles.png', content_type: 'image/png')
venue_6.save!

venue_7 = Venue.new(name: 'Château de Saint-Germain-en-Laye', latitude: '48.898908', longitude: '2.093761', zip: '78100', category: 'Monuments historiques', address: "Place Charles de Gaulle, 78100 Saint-Germain-en-Laye")
file = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FCh%25C3%25A2teau_de_Saint-Germain-en-Laye&psig=AOvVaw2pgnozUHSQoQgZgJe64MeB&ust=1590587358715000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCJD6kOrV0ekCFQAAAAAdAAAAABAJ')
venue_7.photo.attach(io: file, filename: 'chateaustger.png', content_type: 'image/png')
venue_7.save!

venue_8 = Venue.new(name: 'Parc Naturel Régional du Vexin français', latitude: '49.1167', longitude: '1.9', zip: '95450', category: 'Parc', address: "Maison du Parc, 95450 Théméricourt")
file = URI.open("https://p1.storage.canalblog.com/25/23/921790/116061691_o.jpg")
venue_8.photo.attach(io: file, filename: 'vexin.png', content_type: 'image/png')
venue_8.save!

venue_9 = Venue.new(name: 'Forêt de Fontainebleau', latitude: '48.4', longitude: '2.7', zip: '77300', category: 'Parc', address: "Place du Général de Gaulle 77300 Fontainebleau")
file = URI.open("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.nature-loisir.fr%2Factivites%2Fescalade-en-foret-de-fontainebleau%2F&psig=AOvVaw0DqC5d6-2ppoGS34J1jKw2&ust=1590588754300000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCIj43IPb0ekCFQAAAAAdAAAAABAD")
venue_9.photo.attach(io: file, filename: 'fontainebleau.png', content_type: 'image/png')
venue_9.save!

venue_10 = Venue.new(name: 'Vallée de la chevreuse', latitude: '48.712068', longitude: '2.0679502', zip: '78470', category: 'Parc', address: "Vallée, Rue de la Vallée, 78470 Saint-Rémy-lès-Chevreuse")
file = URI.open("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.parc-naturel-chevreuse.fr%2Fdestination-parc%2Fpanorama-se-deplacer-acces%2Facces&psig=AOvVaw0nTLq913AMjLVOasSP_-dU&ust=1590588855609000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKjw4q_b0ekCFQAAAAAdAAAAABAD")
venue_10.photo.attach(io: file, filename: 'chevreuse.png', content_type: 'image/png')
venue_10.save!
