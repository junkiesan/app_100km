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
# puts "Destroy Venues"
Venue.destroy_all
puts 'Creating user...'
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


# CLIENT_SECRET = "1SYIJU13LOXMCXD1PUOXBZXHPTZHBND0KHPG2CAVIYFWLARE"
# CLIENT_ID = "3Q45GBEI2ID5FH3AGWLSVDJAB1DXNHMCP3TEJ5WZDCEYPANO"
# CITIES = ['Paris'] # => Add Cities
# CATEGORIES = ['Musee', 'Parc', 'Plage', 'Monument'] # => Add Categories
# CITIES.each do |city|
#   puts "Fetching: #{city}"
#   CATEGORIES.each do |category|
#     puts "-- Category: #{category}"
#     response = RestClient.get "https://api.foursquare.com/v2/venues/search?near=#{city},France&client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}&v=20202005&query=#{category}&locale=fr&limit=5"
#     data = JSON.parse(response)
#     data["response"]["venues"].each do |item|
#       if item['categories'].any?
#         venue = Venue.new(
#           name: item['name'],
#           latitude: item['location']['lat'],
#           longitude: item['location']['lng'],
#           zip: item['location']['postalCode'],
#           category: item['categories'].first['name'],
#           address: item['location']['formattedAddress'][0]
#         )
#         # GET PHOTO
#         photo_response = RestClient.get "https://api.foursquare.com/v2/venues/#{item['id']}/photos?client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}&v=20202005"
#         photo_data = JSON.parse(photo_response)
#         if photo_data['response']['photos']['items'].first
#           prefix = photo_data['response']['photos']['items'].first['prefix']
#           suffix = photo_data['response']['photos']['items'].first['suffix']
#           file = URI.open("#{prefix}500x500#{suffix}")
#           venue.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
#           venue.save!
#         end
#       end
#     end
#   end
# end

puts 'Creating venues...'

venue_1 = Venue.new(name: 'Fondation Claude Monet', latitude: '48.8656', longitude: '2.3789894', zip: '27620', category: 'Monument', address: '84 Rue Claude Monet, 27620 Giverny')
file = URI.open('https://storage.lebonguide.com/crop-1600x700/52/69/3CF38B80-8C65-4CFB-B802-9816CF460576.png')
venue_1.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_1.save!

venue_2 = Venue.new(name: 'Musée des impressionnismes', latitude: '49.0763478', longitude: '1.5313261', zip: '27620', category: 'Musee', address: '99 Rue Claude Monet, 27620 Giverny')
file = URI.open('https://www.aleou.fr/images/etablissements/2728/max/img_5278_7324.jpg')
venue_2.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_2.save!

venue_3 = Venue.new(name: 'Musée de Mécanique Naturelle', latitude: '49.0772245', longitude: '1.5300958', zip: '27620', category: 'Musee', address: '2 Rue Blanche Hoschede Monet, 27620 Giverny')
file = URI.open('https://media-cdn.tripadvisor.com/media/photo-s/08/63/ee/14/musee-de-mecanique-naturelle.jpg')
venue_3.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_3.save!

venue_4 = Venue.new(name: 'Église Sainte-Radegonde de Giverny', latitude: '49.0779473', longitude: '1.522953', zip: '27620', category: 'Monument', address: '53 Rue Claude Monet, 27620 Giverny')
file = URI.open('https://www.justacote.com/photos_entreprises/eglise-sainte-radegonde-giverny-14325309030.jpg')
venue_4.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_4.save!

venue_5 = Venue.new(name: 'Forêt domaniale de Meudon', latitude: '48.8008072', longitude: '2.2108289', zip: '92360', category: 'Parc', address: 'Forêt domaniale de Meudon, 92360 Meudon')
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/f/f3/EtangVillebon.jpg')
venue_5.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_5.save!

puts 'Creating venues...'
venue_6 = Venue.new(name: 'Château de Versailles', latitude: '48.8', longitude: '2.1333', zip: '78000', category: 'Monuments historiques', address: "Place d'Armes, 78000 Versailles")
file = URI.open('https://lesdemoisellesaversailles.fr/wp-content/uploads/2019/12/chateau-de-versailles-photo.jpg')
venue_6.save!

venue_7 = Venue.new(name: 'Château de Saint-Germain-en-Laye', latitude: '48.898908', longitude: '2.093761', zip: '78100', category: 'Monuments historiques', address: "Place Charles de Gaulle, 78100 Saint-Germain-en-Laye")
file = URI.open('https://static.apidae-tourisme.com/filestore/objets-touristiques/images/47/36/3875887-diaporama.jpg')
venue_7.photos.attach(io: file, filename: 'chateaustger.png', content_type: 'image/png')
venue_7.save!

venue_8 = Venue.new(name: 'Parc Naturel Régional du Vexin français', latitude: '49.1167', longitude: '1.9', zip: '95450', category: 'Parc', address: "Maison du Parc, 95450 Théméricourt")
file = URI.open("https://p1.storage.canalblog.com/25/23/921790/116061691_o.jpg")
venue_8.photos.attach(io: file, filename: 'vexin.png', content_type: 'image/png')
venue_8.save!

venue_9 = Venue.new(name: 'Forêt de Fontainebleau', latitude: '48.4', longitude: '2.7', zip: '77300', category: 'Parc', address: "Place du Général de Gaulle 77300 Fontainebleau")
file = URI.open('https://www.destinationsdejulie.fr/images/photos/france/foretfontainebleau/entete.jpg')
venue_9.photos.attach(io: file, filename: 'fontainebleau.png', content_type: 'image/png')
venue_9.save!

venue_10 = Venue.new(name: 'Vallée de la chevreuse', latitude: '48.712068', longitude: '2.0679502', zip: '78470', category: 'Parc', address: "Vallée, Rue de la Vallée, 78470 Saint-Rémy-lès-Chevreuse")
file = URI.open('https://rando.pnr-idf.fr/media/paperclip/trekking_trek/29802/chateau-madeleinepetit_1.jpg.800x800_q85_watermark-d41d8cd98f00b204e9800998ecf8427e.jpg')
venue_10.photos.attach(io: file, filename: 'chevreuse.png', content_type: 'image/png')
venue_10.save!
