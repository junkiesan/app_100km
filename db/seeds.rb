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

puts "Destroy Reviews"
Review.destroy_all

puts "Destroy Messages"
Message.destroy_all

puts "Destroy Chatrooms"
Chatroom.destroy_all

puts "Destroy Invitation"
Invitation.destroy_all

puts "Destroy Trips"
Trip.destroy_all

puts "Destroy Users"
User.destroy_all

puts "Destroy Venues"
Venue.destroy_all

puts 'Creating user...'

aurian = User.create!(name: 'Aurian GL', email: 'user1@100km.com', password: '123456')
basile = User.create!(name: 'Basile Marquefave', email: 'user2@100km.com', password: '123456')
cecile = User.create!(name: 'Cécile Dezy', email: 'user3@100km.com', password: '123456')
dimitri = User.create!(name: 'Dimitri Bosch', email: 'user4@100km.com', password: '123456')

diane = User.create!(name: 'Diane Johnston-Roussillon', email: 'user5@100km.com', password: '123456')
file = URI.open('https://avatars2.githubusercontent.com/u/43373459?v=4')
diane.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
diane.save!

edouard = User.create!(name: 'Edouard Foussier', email: 'user6@100km.com', password: '123456')
fred = User.create!(name: 'Frédéric Laffont', email: 'user7@100km.com', password: '123456')
hadrien = User.create!(name: 'Hadrien Matringe', email: 'user8@100km.com', password: '123456')
julien = User.create!(name: 'Julien Da Silva', email: 'user9@100km.com', password: '123456')
lomig = User.create!(name: 'Guillaume Lomig Enfroy', email: 'user10@100km.com', password: '123456')
louis = User.create!(name: 'Louis Sommer', email: 'user11@100km.com', password: '123456')
philippine = User.create!(name: 'Philippine Berton', email: 'user12@100km.com', password: '123456')

paul = User.create!(name: 'Paul Lahana', email: 'user13@100km.com', password: '123456')
file = URI.open('https://avatars1.githubusercontent.com/u/26028980?v=4')
paul.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
paul.save!

romain = User.create!(name: 'Romain Sanson', email: 'user14@100km.com', password: '123456')
file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1544604383/pnqv3gmdpbtqrstpqgls.jpg')
romain.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
romain.save!

thomas = User.create!(name: 'Thomas Desmoulins', email: 'user15@100km.com', password: '123456')

# CLIENT_SECRET = "DFBAQSN053VYIGQYLPTSI4ETXQ3PB1IIXUS1455EHOJEJGRQ"
# CLIENT_ID = "5PX51VG5G0LLVYDSI0LNISENVY4WSGRZWM21ZNC3THKGQI4X"
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

# REVIEWS

puts 'Creating reviews...'


review_gv_1 = Review.new(rating: 5, comment: "Grandiose et sauvage (en hiver). Prévoir plusieurs jours de randonnée.")
review_gv_1.user_id = Paul.id
review_gv_1.venue_id = venue_1.id

review_gv_2 = Review.new(rating: 3, comment: "C'est un site exceptionnel ! Malheureusement, il y a beaucoup trop de monde en été!")
review_gv_2.user_id = Romain.id
review_gv_2.venue_id = venue_1.id

review_gv_3 = Review.new(rating: 4, comment: "Endroit paradisiaque où règnent le calme et les cigales")
review_gv_3.user_id = Diane.id
review_gv_3.venue_id = venue_1.id

puts 'Creating reviews...'

review_or_1 = Review.new(rating: 5, comment: "À visiter. Dépaysement total. Circuit facile et pratique. À faire en amoureux ou en famille")
review_or_1.user_id = Paul.id
review_or_1.venue_id = venue_2.id

review_or_2 = Review.new(rating: 3, comment: "C'est juste superbe. Un site magique. On en prend plein les yeux.")
review_or_2.user_id = Romain.id
review_or_2.venue_id = venue_2.id

review_or_3 = Review.new(rating: 4, comment: "En cette sortie de confinement pas bcp de monde balade agréable")
review_or_3.user_id = Diane.id
review_or_3.venue_id = venue_2.id

puts 'Creating reviews...'

review_pv_1 = Review.new(rating: 5, comment: "Magnifique ! On est venu passer un weekend pour contempler les champs de lavande. A faire au moins une fois dans sa vie.")
review_pv_1.user_id = Paul.id
review_pv_1.venue_id = venue_6.id

review_pv_2 = Review.new(rating: 3, comment: "Lieu magique avec les vallons aux couleurs de la lavande et des tournesols.")
review_pv_2.user_id = Romain.id
review_pv_2.venue_id = venue_6.id

review_pv_3 = Review.new(rating: 4, comment: "Beau mais il faut choisir la bonne saison et le bon moment dans la journée")
review_pv_3.user_id = Diane.id
review_pv_3.venue_id = venue_6.id

puts 'Creating reviews...'

review_cc_1 = Review.new(rating: 5, comment: "Belle ballade à faire mais si vous avez le choix, préférable en hors saison.")
review_cc_1.user_id = Paul.id
review_cc_1.venue_id = venue_3.id

review_cc_2 = Review.new(rating: 3, comment: "Splendide. sortie à ne pas rater si vous êtes dans le coin. avec la baignade dans les eaux turquoises... juste 100% de plaisir")
review_cc_2.user_id = Romain.id
review_cc_2.venue_id = venue_3.id

review_cc_3 = Review.new(rating: 4, comment: "C'est génial, les explications pendant la traversée sont bien menees, un agréable moment")
review_cc_3.user_id = Diane.id
review_cc_3.venue_id = venue_3.id

puts 'Creating reviews...'

review_p_1 = Review.new(rating: 5, comment: "Sublime prévoir le pique-nique pour profiter des crique 😉")
review_p_1.user_id = Paul.id
review_p_1.venue_id = venue_5.id

review_p_2 = Review.new(rating: 3, comment: "Beau mais un peu surfait, beaucoup d'algues sur les plages, a vélo c'est très bien")
review_p_2.user_id = Romain.id
review_p_2.venue_id = venue_5.id

review_p_3 = Review.new(rating: 4, comment: "C'est il est vraiment magnifique surtout à vélo")
review_p_3.user_id = Diane.id
review_p_3.venue_id = venue_5.id

puts 'Creating reviews...'

review_pp_1 = Review.new(rating: 5, comment: "Magnifique et calme pour le moment")
review_pp_1.user_id = Paul.id
review_pp_1.venue_id = venue_11.id

review_pp_2 = Review.new(rating: 3, comment: "Très belle plage, malheureusement trop de bruit des bars de plage 😟")
review_pp_2.user_id = Romain.id
review_pp_2.venue_id = venue_11.id

review_pp_3 = Review.new(rating: 4, comment: "Plage en cours de travaux pour l'été et magnifique hors saison.")
review_pp_3.user_id = Diane.id
review_pp_3.venue_id = venue_11.id

puts 'Creating reviews...'

review_tl_1 = Review.new(rating: 5, comment: "Superbe lieu à visiter")
review_tl_1.user_id = Paul.id
review_tl_1.venue_id = venue_10.id

review_tl_2 = Review.new(rating: 3, comment: "Quels splendides paysages !")
review_tl_2.user_id = Romain.id
review_tl_2.venue_id = venue_10.id

review_tl_3 = Review.new(rating: 4, comment: "Beau massif. Vive la nature. A préserver sans modération....")
review_tl_3.user_id = Diane.id
review_tl_3.venue_id = venue_10.id

puts 'Creating reviews...'

review_nd_1 = Review.new(rating: 5, comment: "La lumière etait ce jour là autant à l'extérieur qu'à l'intérieur.")
review_nd_1.user_id = Paul.id
review_nd_1.venue_id = venue_9.id

review_nd_2 = Review.new(rating: 3, comment: "Très jolie église")
review_nd_2.user_id = Romain.id
review_nd_2.venue_id = venue_9.id

review_nd_3 = Review.new(rating: 4, comment: "A voir pour le lieu et notre histoire, que l'on soit croyant ou non")
review_nd_3.user_id = Diane.id
review_nd_3.venue_id = venue_9.id

puts 'Creating reviews...'

review_av_1 = Review.new(rating: 5, comment: "Super ville je kiffe a fond ")
review_av_1.user_id = Paul.id
review_av_1.venue_id = venue_4.id

review_av_2 = Review.new(rating: 3, comment: "Grosse deception le pont est cassé !")
review_av_2.user_id = Romain.id
review_av_2.venue_id = venue_4.id

review_av_3 = Review.new(rating: 4, comment: "Le festival d'Avignon est une tuerie de malade oui !")
review_av_3.user_id = Diane.id
review_av_3.venue_id = venue_4.id

puts 'Creating reviews...'

review_aa_1 = Review.new(rating: 5, comment: "Joli lieu, mais on y pratique la torture!")
review_aa_1.user_id = Paul.id
review_aa_1.venue_id = venue_7.id

review_aa_2 = Review.new(rating: 3, comment: "Très belle arène au centre de la belle ville d'Arles ou il est possible de visiter pour la somme de 8€")
review_aa_2.user_id = Romain.id
review_aa_2.venue_id = venue_7.id

review_aa_3 = Review.new(rating: 4, comment: "Très bien. Quelle grandeur... spectaculaire monument.")
review_aa_3.user_id = Diane.id
review_aa_3.venue_id = venue_7.id

puts 'Creating reviews...'

review_mp_1 = Review.new(rating: 5, comment: "Attention : entrée impossible avec une valise, même petite.")
review_mp_1.user_id = Paul.id
review_mp_1.venue_id = venue_8.id

review_mp_2 = Review.new(rating: 3, comment: "Réputé et atypique. On aime ou pas mais on ne peut pas  rester insensible. A voir absolument !")
review_mp_2.user_id = Romain.id
review_mp_2.venue_id = venue_8.id

review_mp_3 = Review.new(rating: 4, comment: "Très beau musée. Super exposition « Tableaux magiques »")
review_mp_3.user_id = Diane.id
review_mp_3.venue_id = venue_8.id



# AIX EN PROVENCE

puts 'Creating venues...'

# PARC

venue_1 = Venue.new(name: 'Les Gorges du Verdon', latitude: '43.779676', longitude: '6.35686', zip: '04500', category: 'Parc', address: 'La Palud-sur-Verdon', description: 'Les gorges du Verdon sont un canyon creusé par la rivière Verdon séparant les Préalpes de Castellane et les Préalpes de Digne, en France.')
file = URI.open('https://cdn.generationvoyage.fr/2017/08/visiter-france-gorges-verdon.jpg')
file_2 = URI.open('https://www.google.com/url?sa=i&url=http%3A%2F%2Fwww.castellane-verdontourisme.com%2Fje-decouvre-tout-un-pays%2Fbestof-castellane%2F&psig=AOvVaw1xjhQ1vxrx56ATP46OwKXA&ust=1591345745359000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLD_8oHf5-kCFQAAAAAdAAAAABAh')
file_3 = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Ffigaronautisme.meteoconsult.fr%2Factus-nautisme-escales%2F2019-08-31%2F35246-les-gorges-du-verdon-un-site-naturel-unique-en-europe&psig=AOvVaw1xjhQ1vxrx56ATP46OwKXA&ust=1591345745359000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLD_8oHf5-kCFQAAAAAdAAAAABAn')
venue_1.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_1.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
venue_1.photos.attach(io: file_3, filename: 'nes.png', content_type: 'image/png')

venue_1.save!

venue_2 = Venue.new(name: 'Les Ocres de Rustrel', latitude: '43.92363', longitude: '5.48598', zip: '84400', category: 'Parc', address: 'Provence Alpes Côte d’Azur', description: 'Le Colorado provençal ou ocres de Rustrel est un site industriel, exploité depuis la fin du xviie siècle jusqu en 1992 où le dernier ocrier prit sa retraite. Le site est situé sur la commune de Rustrel dans le département de Vaucluse et la région Provence-Alpes-Côte d Azur. Les paysages insolites qu il offre sont constitués de sable ocreux d origine latéritique.')
file = URI.open('https://cdn.generationvoyage.fr/2017/08/visiter-france-ocres-rustrel.jpg')
file_2 = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Flamariniereenvoyage.com%2Fles-ocres-de-provence-rustrel-roussillon%2F&psig=AOvVaw2QcT4Pq-fS0OyewXM3qaPf&ust=1591348300775000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCPiVmsTo5-kCFQAAAAAdAAAAABAJ')
file_3 = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Fdailygeekshow.com%2Focres-rustrel-provence%2F&psig=AOvVaw2QcT4Pq-fS0OyewXM3qaPf&ust=1591348300775000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCPiVmsTo5-kCFQAAAAAdAAAAABAP')
venue_2.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_2.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
venue_2.photos.attach(io: file_3, filename: 'nes.png', content_type: 'image/png')

venue_2.save!

venue_6 = Venue.new(name: 'Le Plateau de Valensole', latitude: '43.8333', longitude: '5.9833', zip: '04210', category: 'Parc', address: "Digne-les-Bains", description: 'Le Plateau de Valensole est une région naturelle de France située dans les Alpes-de-Haute-Provence, au sud-ouest de Digne-les-Bains, entre les vallées de la Durance à l ouest, de l Asse au nord, des Gorges du Verdon et du lac de Sainte-Croix au sud.')
file = URI.open('https://www.actualitix.com/wp-content/uploads/2017/09/plateau-de-valensole.jpg')
file_2 = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.camping-la-verdiere-83.com%2FTourisme%2Fplateau-de-valensole%2F&psig=AOvVaw28EFPmOrOaSylLXq4G640w&ust=1591348629552000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCODBx6Lt5-kCFQAAAAAdAAAAABAN')
file_3 = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.closdevilleneuve.fr%2Fvalensole%2Findex.php%2Fproject%2Fle-plateau%2F&psig=AOvVaw3g0NnQK2PgvBjEa8jZ7tJz&ust=1591349613169000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCPCvq7bt5-kCFQAAAAAdAAAAABAD')
venue_6.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_6.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
venue_6.photos.attach(io: file_3, filename: 'nes.png', content_type: 'image/png')

venue_6.save!


puts 'Creating venues...'

# PLAGE

venue_3 = Venue.new(name: 'Les calanques de Cassis', latitude: '43.2167', longitude: '5.5333', zip: '13260', category: 'Plage', address: 'Marseille', description: 'À l ouest de Cassis, le Massif des Calanques est constitué de calcaire blanc de plus de 400 m d’épaisseur. Des vallées marines se sont creusées, créant de véritables fjords miniatures, abritant parfois de magnifiques anses naturelles.')
file = URI.open('https://cdn.generationvoyage.fr/2017/08/visiter-france-calanques-cassis.jpg')
file_2 = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.marseilletourisme.fr%2Ffr%2Fque-voir%2Fcalanques%2F&psig=AOvVaw3q3Io7ErcvJHNXaga4CHwC&ust=1591349633040000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLDhvr_t5-kCFQAAAAAdAAAAABAD')
file_3 = URI.open('https://www.google.com/url?sa=i&url=http%3A%2F%2Fwww.calanques13.com%2F&psig=AOvVaw3q3Io7ErcvJHNXaga4CHwC&ust=1591349633040000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLDhvr_t5-kCFQAAAAAdAAAAABAI')
venue_3.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_3.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
venue_3.photos.attach(io: file_3, filename: 'nes.png', content_type: 'image/png')
venue_3.save!

venue_5 = Venue.new(name: 'Porquerolles', latitude: '43.0', longitude: '6.2', zip: '83400', category: 'Plage', address: "Îles d'Hyères", description: 'L’île de Porquerolles est la plus grande et la plus occidentale des trois îles d Hyères avec ses 12,54 km² de superficie. Elle se situe à 2,6 km au sud-est de la Tour Fondue, l extrémité sud de la presqu île de Giens, et à 9,6 km à l ouest de l île de Port-Cros.')
file = URI.open('https://cdn.generationvoyage.fr/2020/05/ile-porquerolles.jpg')
file_2 = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.latitudeverte.fr%2Fporquerolles%2F&psig=AOvVaw3Mki2z-QCWY7ZVvk8gdnxU&ust=1591349672199000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKCcgtLt5-kCFQAAAAAdAAAAABAD')
file_3 = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.visitvar.fr%2Ffr%2Fles-incontournables%2Fterre-et-mer%2Files-d-hyeres%2F&psig=AOvVaw3Mki2z-QCWY7ZVvk8gdnxU&ust=1591349672199000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKCcgtLt5-kCFQAAAAAdAAAAABAJ')
venue_5.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_5.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
venue_5.photos.attach(io: file_3, filename: 'nes.png', content_type: 'image/png')
venue_5.save!

venue_11 = Venue.new(name: 'Pampelonne', latitude: '43.2271', longitude: '6.6622', zip: '83990', category: 'Plage', address: "Saint-Tropez", description: 'Rendue célèbre par Brigitte Bardot dans les années 50, la plage de Pampelonne est parfaite pour une journée de tranquillité, les pieds dans l’eau ou en terrasse.')
file = URI.open('https://www.talamare.fr/medias/2605-tour-2267-tour-yacht-charter-st-tropez-yacht-rental-st-tropez-1.jpg')
file_2 = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.tendancehotellerie.fr%2Farticles-breves%2Fcommunique-de-presse%2F11270-article%2Fla-reserve-a-la-plage-nouvelle-escale-chic-a-pampelonne&psig=AOvVaw3CSf-2drAzzCjfEAYEXw_5&ust=1591349698999000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMCX4eDt5-kCFQAAAAAdAAAAABAD')
file_3 = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Ftwitter.com%2Fgolfesttropez%2Fstatus%2F967037862368686081&psig=AOvVaw3CSf-2drAzzCjfEAYEXw_5&ust=1591349698999000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMCX4eDt5-kCFQAAAAAdAAAAABAJ')
venue_11.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_11.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
venue_11.photos.attach(io: file_3, filename: 'nes.png', content_type: 'image/png')
venue_11.save!


# RANDOS

puts 'Creating venues...'

venue_10 = Venue.new(name: 'Tour du Luberon', latitude: '43.7961', longitude: '5.2239', zip: '84240', category: 'Foret', address: 'Massif du Luberon', description: 'Villages perchés, bories, châteaux, monuments, mais aussi falaises et garrigues.. autant de richesses regroupées sur un seul territoire.')
file = URI.open('https://www.lagrande-verriere.com/wp-content/uploads/2018/11/luberon-provence-idees-sorties-villages-tourisme-2.jpg')
file_2 = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.respyrenees.com%2Ffr%2Frandonnee-montagne-pyrenees%2F125-le-tour-du-luberon-a-velo&psig=AOvVaw32CnhxvQQYtquSnV34iOW5&ust=1591349739480000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMCgn_Xt5-kCFQAAAAAdAAAAABAD')
file_3 = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.velorizons.com%2Fraid-vtt%2Ffrance%2Fprovence%2FCY14-vtt-vaucluse.html&psig=AOvVaw32CnhxvQQYtquSnV34iOW5&ust=1591349739480000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMCgn_Xt5-kCFQAAAAAdAAAAABAJ')
venue_10.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_10.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
venue_10.photos.attach(io: file_3, filename: 'nes.png', content_type: 'image/png')
venue_10.save!

puts 'Creating venues...'

# À VELO

puts 'Creating venues...'


# CULTURE

venue_9 = Venue.new(name: 'Basilique Notre-Dame de la Garde', latitude: '43.2840', longitude: '5.3712', zip: '91310', category: 'Monuments historiques', address: "Longpont-sur-Orge", description: 'La basilique Notre-Dame-de-Bonne-Garde est une basilique de culte catholique, dédiée à Notre-Dame, située dans la commune française de Longpont-sur-Orge et le département de l Essonne.')
file = URI.open('https://rando.pnr-idf.fr/media/paperclip/trekking_trek/29802/chateau-madeleinepetit_1.jpg.800x800_q85_watermark-d41d8cd98f00b204e9800998ecf8427e.jpg')
file_2 = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.myprovence.fr%2Fguide-de-voyage%2Fdivertissements%2Flieux-culturels%2Fmarseille%2F9364-basilique-notre-dame-de-la-garde&psig=AOvVaw2NL50WxW_sL2zjM1xVjVHO&ust=1591349774784000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMClmoTu5-kCFQAAAAAdAAAAABAD')
file_3 = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Ffrance3-regions.francetvinfo.fr%2Fprovence-alpes-cote-d-azur%2Fbouches-du-rhone%2Fmarseille%2Fsolidarite-notre-dame-cloches-notre-dame-garde-sonnent-1656952.html&psig=AOvVaw2NL50WxW_sL2zjM1xVjVHO&ust=1591349774784000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMClmoTu5-kCFQAAAAAdAAAAABAJ')
venue_9.photos.attach(io: file, filename: 'chevreuse.png', content_type: 'image/png')
venue_9.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
venue_9.photos.attach(io: file_3, filename: 'nes.png', content_type: 'image/png')
venue_9.save!

venue_4 = Venue.new(name: 'Avignon', latitude: '43.9493', longitude: '4.8055', zip: '84000', category: 'Culture', address: 'Avignon', description: 'Avignon, ville de Provence dans le sud-est de la France, est traversée par le Rhône. De 1309 à 1377, les papes catholiques élisent résidence dans la ville. Celle-ci reste sous le règne pontifical jusqu’en 1791, date à laquelle elle est rattachée à la France. Le Palais des Papes, qui se trouve dans le centre-ville, est entouré de remparts médiévaux en pierre et témoigne de cette histoire.')
file = URI.open('https://cdn.generationvoyage.fr/2019/10/vue-sur-le-pont-d-avignon-vue-depuis-le-rhone.jpg')
file_2 = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.avignon-et-provence.com%2F&psig=AOvVaw082MGoNloVRETO4UazskeE&ust=1591349806055000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKjg35Hu5-kCFQAAAAAdAAAAABAD')
file_3 = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.terre.tv%2Fque-faire-a%2Favignon%2F&psig=AOvVaw082MGoNloVRETO4UazskeE&ust=1591349806055000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKjg35Hu5-kCFQAAAAAdAAAAABAJ')
venue_4.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_4.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
venue_4.photos.attach(io: file_3, filename: 'nes.png', content_type: 'image/png')
venue_4.save!

venue_7 = Venue.new(name: "Arènes d'Arles", latitude: '43.6778', longitude: '4.6309', zip: '13200', category: 'Culture', address: "Rond-Point des Arènes, Arles", description: 'Les Arènes d Arles sont un amphithéâtre romain construit vers 80 apr. J.-C. / 90 apr. J.-C. par les ordres de Tibère César Auguste, dans le cadre des extensions flaviennes de la ville.')
file = URI.open('https://cdn.thecrazytourist.com/wp-content/uploads/2016/11/Les-Ar%C3%A8nes-1024x705.jpg')
file_2 = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.hoteldespontsdarles.com%2Fsejour-hotel-arles&psig=AOvVaw1Iq90EPT_GB7gjQuW7Om9J&ust=1591349832836000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNCQ6p7u5-kCFQAAAAAdAAAAABAJ')
file_3 = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.ledauphine.com%2Fedition-vaucluse%2F2020%2F04%2F14%2Farles-sans-sa-feria&psig=AOvVaw1Iq90EPT_GB7gjQuW7Om9J&ust=1591349832836000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNCQ6p7u5-kCFQAAAAAdAAAAABAP')
venue_7.photos.attach(io: file, filename: 'chateaustger.png', content_type: 'image/png')
venue_7.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
venue_7.photos.attach(io: file_3, filename: 'nes.png', content_type: 'image/png')
venue_7.save!

venue_8 = Venue.new(name: 'Musée Picasso', latitude: '43.5808', longitude: '7.1283', zip: '06600', category: 'Culture', address: "Antibes, Juan-Les-Pins", description: 'Le musée Picasso est le musée national français consacré à la vie et à l œuvre de Pablo Picasso ainsi qu aux artistes qui lui furent liés.')
file = URI.open("https://www.francetvinfo.fr/image/75nfocijh-36d4/578/325/19440255.jpg")
file_2 = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.villa-arson.org%2F2015%2F09%2Fmusee-picasso-dantibes-centre-international-de-valbonne%2F&psig=AOvVaw3udD_jg7vC-ix379ZRS5vB&ust=1591350039698000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCJDfg4Tv5-kCFQAAAAAdAAAAABAD')
file_3 = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.antibesjuanlespins.com%2Fdecouvrir%2Fles-incontournables%2Fle-musee-picasso&psig=AOvVaw3udD_jg7vC-ix379ZRS5vB&ust=1591350039698000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCJDfg4Tv5-kCFQAAAAAdAAAAABAJ')
venue_8.photos.attach(io: file, filename: 'vexin.png', content_type: 'image/png')
venue_8.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
venue_8.photos.attach(io: file_3, filename: 'nes.png', content_type: 'image/png')
venue_8.save!



# PARIS

# venue_1 = Venue.new(name: 'Fondation Claude Monet', latitude: '48.8656', longitude: '2.3789894', zip: '27620', category: 'Monument', address: '84 Rue Claude Monet, 27620 Giverny')
# file = URI.open('https://storage.lebonguide.com/crop-1600x700/52/69/3CF38B80-8C65-4CFB-B802-9816CF460576.png')
# venue_1.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
# venue_1.save!

# venue_2 = Venue.new(name: 'Musée des impressionnismes', latitude: '49.0763478', longitude: '1.5313261', zip: '27620', category: 'Musee', address: '99 Rue Claude Monet, 27620 Giverny')
# file = URI.open('https://www.aleou.fr/images/etablissements/2728/max/img_5278_7324.jpg')
# venue_2.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
# venue_2.save!

# venue_3 = Venue.new(name: 'Musée de Mécanique Naturelle', latitude: '49.0772245', longitude: '1.5300958', zip: '27620', category: 'Musee', address: '2 Rue Blanche Hoschede Monet, 27620 Giverny')
# file = URI.open('https://media-cdn.tripadvisor.com/media/photo-s/08/63/ee/14/musee-de-mecanique-naturelle.jpg')
# venue_3.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
# venue_3.save!

# venue_4 = Venue.new(name: 'Église Sainte-Radegonde de Giverny', latitude: '49.0779473', longitude: '1.522953', zip: '27620', category: 'Monument', address: '53 Rue Claude Monet, 27620 Giverny')
# file = URI.open('https://www.justacote.com/photos_entreprises/eglise-sainte-radegonde-giverny-14325309030.jpg')
# venue_4.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
# venue_4.save!

# venue_5 = Venue.new(name: 'Forêt domaniale de Meudon', latitude: '48.8008072', longitude: '2.2108289', zip: '92360', category: 'Parc', address: 'Forêt domaniale de Meudon, 92360 Meudon')
# file = URI.open('https://upload.wikimedia.org/wikipedia/commons/f/f3/EtangVillebon.jpg')
# venue_5.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
# venue_5.save!

# puts 'Creating venues...'
# venue_6 = Venue.new(name: 'Château de Versailles', latitude: '48.8', longitude: '2.1333', zip: '78000', category: 'Monuments historiques', address: "Place d'Armes, 78000 Versailles")
# file = URI.open('https://lesdemoisellesaversailles.fr/wp-content/uploads/2019/12/chateau-de-versailles-photo.jpg')
# venue_6.save!

# venue_7 = Venue.new(name: 'Château de Saint-Germain-en-Laye', latitude: '48.898908', longitude: '2.093761', zip: '78100', category: 'Monuments historiques', address: "Place Charles de Gaulle, 78100 Saint-Germain-en-Laye")
# file = URI.open('https://static.apidae-tourisme.com/filestore/objets-touristiques/images/47/36/3875887-diaporama.jpg')
# venue_7.photos.attach(io: file, filename: 'chateaustger.png', content_type: 'image/png')
# venue_7.save!

# venue_8 = Venue.new(name: 'Parc Naturel Régional du Vexin français', latitude: '49.1167', longitude: '1.9', zip: '95450', category: 'Parc', address: "Maison du Parc, 95450 Théméricourt")
# file = URI.open("https://p1.storage.canalblog.com/25/23/921790/116061691_o.jpg")
# venue_8.photos.attach(io: file, filename: 'vexin.png', content_type: 'image/png')
# venue_8.save!

# venue_9 = Venue.new(name: 'Forêt de Fontainebleau', latitude: '48.4', longitude: '2.7', zip: '77300', category: 'Parc', address: "Place du Général de Gaulle 77300 Fontainebleau")
# file = URI.open('https://www.destinationsdejulie.fr/images/photos/france/foretfontainebleau/entete.jpg')
# venue_9.photos.attach(io: file, filename: 'fontainebleau.png', content_type: 'image/png')
# venue_9.save!

# venue_10 = Venue.new(name: 'Vallée de la chevreuse', latitude: '48.712068', longitude: '2.0679502', zip: '78470', category: 'Parc', address: "Vallée, Rue de la Vallée, 78470 Saint-Rémy-lès-Chevreuse")
# file = URI.open('https://rando.pnr-idf.fr/media/paperclip/trekking_trek/29802/chateau-madeleinepetit_1.jpg.800x800_q85_watermark-d41d8cd98f00b204e9800998ecf8427e.jpg')
# venue_10.photos.attach(io: file, filename: 'chevreuse.png', content_type: 'image/png')
# venue_10.save!
