# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

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


cecile = User.create!(name: 'Cécile Dezy', email: 'user3@100km.com', password: '123456')
photo = URI.open('https://res.cloudinary.com/wagon/image/upload/v1539599254/janttrofl6xagki5zk6g.jpg')
cecile.photo.attach(io: photo, filename: 'cecile.png', content_type: 'image/png')
cecile.save!

# dimitri = User.create!(name: 'Dimitri Bosch', email: 'user4@100km.com', password: '123456')
# photo = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1523284008/vewklncjschzufwaixd6.jpg')
# dimitri.photo.attach(io: photo, filename: 'dimitri.png', content_type: 'image/png')
# dimitri.save!

romain = User.create!(name: 'Romain Sanson', email: 'user14@100km.com', password: '123456')
photo = URI.open('https://res.cloudinary.com/wagon/image/upload/v1544604383/pnqv3gmdpbtqrstpqgls.jpg')
romain.photo.attach(io: photo, filename: 'romain.png', content_type: 'image/png')
romain.save!

thomas = User.create!(name: 'Thomas Desmoulins', email: 'user15@100km.com', password: '123456')
photo = URI.open('https://res.cloudinary.com/wagon/image/upload/v1585588520/j0m6tlufeayghsj1uqdv.jpg')
thomas.photo.attach(io: photo, filename: 'thomas.png', content_type: 'image/png')
thomas.save!

aurian = User.create!(name: 'Aurian GL', email: 'user1@100km.com', password: '123456')
basile = User.create!(name: 'Basile Marquefave', email: 'user2@100km.com', password: '123456')
dimitri = User.create!(name: 'Dimitri Bosch', email: 'user4@100km.com', password: '123456')
diane = User.create!(name: 'Diane Johnston-Roussillon', email: 'user5@100km.com', password: '123456')
edouard = User.create!(name: 'Edouard Foussier', email: 'user6@100km.com', password: '123456')
fred = User.create!(name: 'Frédéric Laffont', email: 'user7@100km.com', password: '123456')
hadrien = User.create!(name: 'Hadrien Matringe', email: 'user8@100km.com', password: '123456')
julien = User.create!(name: 'Julien Da Silva', email: 'user9@100km.com', password: '123456')
lomig = User.create!(name: 'Guillaume Lomig Enfroy', email: 'user10@100km.com', password: '123456')
louis = User.create!(name: 'Louis Sommer', email: 'user11@100km.com', password: '123456')
philippine = User.create!(name: 'Philippine Berton', email: 'user12@100km.com', password: '123456')

# AIX EN PROVENCE

puts 'Creating venues...'

# PARC

venue_1 = Venue.new(name: 'Les Gorges du Verdon', latitude: '43.779676', longitude: '6.35686', zip: '04500', category: 'Parc', address: 'La Palud-sur-Verdon', description: 'Les gorges du Verdon sont un canyon creusé par la rivière Verdon séparant les Préalpes de Castellane et les Préalpes de Digne, en France.')
file = URI.open('https://cdn.generationvoyage.fr/2017/08/visiter-france-gorges-verdon.jpg')
file2 = URI.open('https://www.viree-malin.fr/wp-content/uploads/2018/12/visiter-activites-gorges-du-verdon.jpg')
file3 = URI.open('https://cdn.generationvoyage.fr/2020/02/gorges-verdon-kayak-755x526.jpg')
venue_1.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_1.photos.attach(io: file2, filename: 'nes.png', content_type: 'image/png')
venue_1.photos.attach(io: file3, filename: 'nes.png', content_type: 'image/png')
venue_1.save!
puts 'First venue created !'

venue_2 = Venue.new(name: 'Les Ocres de Rustrel', latitude: '43.92363', longitude: '5.48598', zip: '84400', category: 'Parc', address: 'Provence Alpes Côte d’Azur', description: 'Le Colorado provençal ou ocres de Rustrel est un site industriel, exploité depuis la fin du xviie siècle jusqu en 1992 où le dernier ocrier prit sa retraite. Le site est situé sur la commune de Rustrel dans le département de Vaucluse et la région Provence-Alpes-Côte d Azur. Les paysages insolites qu il offre sont constitués de sable ocreux d origine latéritique.')
file = URI.open('https://cdn.generationvoyage.fr/2017/08/visiter-france-ocres-rustrel.jpg')
file2 = URI.open('https://static.wixstatic.com/media/a27d24_6f85280ca1a348de9bd733db49dbcfed~mv2.jpg/v1/fit/w_770,h_556,al_c,q_80/file.png')
file3 = URI.open('https://cdn-s-www.ledauphine.com/images/B80D822B-D98F-4A71-B41A-B39672F2CC10/NW_raw/angelique-surel-le-dauphine-libere-rustrel-le-5-juillet-2018-reportage-sur-les-ocres-du-colorado-provencal-angelique-surel-photo-pqr-1563721835.jpg')
venue_2.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_2.photos.attach(io: file2, filename: 'nes.png', content_type: 'image/png')
venue_2.photos.attach(io: file3, filename: 'nes.png', content_type: 'image/png')
venue_2.save!
puts '2 venue created !'

venue_6 = Venue.new(name: 'Le Plateau de Valensole', latitude: '43.8333', longitude: '5.9833', zip: '04210', category: 'Parc', address: "Digne-les-Bains", description: 'Le Plateau de Valensole est une région naturelle de France située dans les Alpes-de-Haute-Provence, au sud-ouest de Digne-les-Bains, entre les vallées de la Durance à l ouest, de l Asse au nord, des Gorges du Verdon et du lac de Sainte-Croix au sud.')
file = URI.open('https://www.actualitix.com/wp-content/uploads/2017/09/plateau-de-valensole.jpg')
file_2 = URI.open('https://www.tourisme-alpes-haute-provence.com/wp-content/uploads/2020/04/lavande-valensole-verneuil-1140x760.jpg')
file_3 = URI.open('https://p7.storage.canalblog.com/71/24/1043820/106819514_o.jpg')
venue_6.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_6.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
venue_6.photos.attach(io: file_3, filename: 'nes.png', content_type: 'image/png')

venue_6.save!
puts '3 venue created !'

puts 'Creating venues...'

# PLAGE

venue_3 = Venue.new(name: 'Les calanques de Cassis', latitude: '43.2167', longitude: '5.5333', zip: '13260', category: 'Plage', address: 'Marseille', description: 'À l ouest de Cassis, le Massif des Calanques est constitué de calcaire blanc de plus de 400 m d’épaisseur. Des vallées marines se sont creusées, créant de véritables fjords miniatures, abritant parfois de magnifiques anses naturelles.')
file = URI.open('https://cdn.generationvoyage.fr/2017/08/visiter-france-calanques-cassis.jpg')
file_2 = URI.open('https://www.augoutdemma.be/wp-content/uploads/2014/07/calanques_cassis-19.jpg')
file_3 = URI.open('https://decouvrirensemble.com/wp-content/uploads/2017/07/calanques-de-cassis-a-pied-blog-voyage-drone.jpg')
venue_3.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_3.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
venue_3.photos.attach(io: file_3, filename: 'nes.png', content_type: 'image/png')
venue_3.save!
puts '4 venue created !'


venue_5 = Venue.new(name: 'Porquerolles', latitude: '43.0', longitude: '6.2', zip: '83400', category: 'Plage', address: "Îles d'Hyères", description: 'L’île de Porquerolles est la plus grande et la plus occidentale des trois îles d Hyères avec ses 12,54 km² de superficie. Elle se situe à 2,6 km au sud-est de la Tour Fondue, l extrémité sud de la presqu île de Giens, et à 9,6 km à l ouest de l île de Port-Cros.')
file = URI.open('https://cdn.generationvoyage.fr/2020/05/ile-porquerolles.jpg')
file_2 = URI.open('https://www.ot-lelavandou.fr/wp-content/uploads/2018/11/ile-de-porquerolles-cg-2017.jpg')
file_3 = URI.open('https://i.pinimg.com/originals/f7/3f/e4/f73fe45a1cadf703a02f9b1c8ea66b9b.jpg')
venue_5.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_5.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
venue_5.photos.attach(io: file_3, filename: 'nes.png', content_type: 'image/png')
venue_5.save!
puts '5 venue created !'


venue_11 = Venue.new(name: 'Pampelonne', latitude: '43.2271', longitude: '6.6622', zip: '83990', category: 'Plage', address: "Saint-Tropez", description: 'Rendue célèbre par Brigitte Bardot dans les années 50, la plage de Pampelonne est parfaite pour une journée de tranquillité, les pieds dans l’eau ou en terrasse.')
file = URI.open('https://www.talamare.fr/medias/2605-tour-2267-tour-yacht-charter-st-tropez-yacht-rental-st-tropez-1.jpg')
file_2 = URI.open('https://www.tendancehotellerie.fr/local/cache-vignettes/L750xH366/arton11270-9b923.jpg?1587561716')
file_3 = URI.open('https://pbs.twimg.com/media/DWuag2wXkAA18uO?format=jpg&name=small')
venue_11.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_11.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
venue_11.photos.attach(io: file_3, filename: 'nes.png', content_type: 'image/png')
venue_11.save!
puts '6 venue created !'

# RANDOS

puts 'Creating venues...'

venue_10 = Venue.new(name: 'Tour du Luberon', latitude: '43.7961', longitude: '5.2239', zip: '84240', category: 'Foret', address: 'Massif du Luberon', description: 'Villages perchés, bories, châteaux, monuments, mais aussi falaises et garrigues.. autant de richesses regroupées sur un seul territoire.')
file = URI.open('https://www.luberon-apt.fr/sites/aptluberon/files/styles/ratio_16_9_xl/public/content/images/les_ocres_a_10.jpg?itok=Qwt96sxd')
file_2 = URI.open('https://www.janssens-immobilier.com/images/secteurs/luberon.jpg')
file_3 = URI.open('https://media-cdn.tripadvisor.com/media/photo-m/1280/13/b8/34/65/le-village-de-roussillon.jpg')
venue_10.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_10.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
venue_10.photos.attach(io: file_3, filename: 'nes.png', content_type: 'image/png')
#venue_10.photos.attach(io: file_3, filename: 'nes.png', content_type: 'image/png')
venue_10.save!
puts '7 venue created !'
# venue_13 = Venue.new(name: 'Porquerolles', latitude: '43.0', longitude: '6.2', zip: '83400', category: 'Plage', address: "Îles d'Hyères", description: 'L’île de Porquerolles est la plus grande et la plus occidentale des trois îles d Hyères avec ses 12,54 km² de superficie. Elle se situe à 2,6 km au sud-est de la Tour Fondue, l extrémité sud de la presqu île de Giens, et à 9,6 km à l ouest de l île de Port-Cros.')
# file = URI.open('https://cdn.generationvoyage.fr/2020/05/ile-porquerolles.jpg')
# venue_13.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
# venue_13.save!

puts 'Creating venues...'

# À VELO

puts 'Creating venues...'


# CULTURE

venue_9 = Venue.new(name: 'Basilique Notre-Dame de la Garde', latitude: '43.2840', longitude: '5.3712', zip: '91310', category: 'Monuments historiques', address: "Longpont-sur-Orge", description: 'La basilique Notre-Dame-de-Bonne-Garde est une basilique de culte catholique, dédiée à Notre-Dame, située dans la commune française de Longpont-sur-Orge et le département de l Essonne.')
file = URI.open('https://rando.pnr-idf.fr/media/paperclip/trekking_trek/29802/chateau-madeleinepetit_1.jpg.800x800_q85_watermark-d41d8cd98f00b204e9800998ecf8427e.jpg')
file_2 = URI.open('https://www.notrehistoireavecmarie.com/asset/upload/esc/esc14/esc1.jpg')
file_3 = URI.open('https://france3-regions.francetvinfo.fr/provence-alpes-cote-d-azur/sites/regions_france3/files/styles/top_big/public/assets/images/2019/04/18/la_basilique_notre-dame-de-la-garde_a_marseille_bouches-du-rhone-4194028.jpg?itok=zk7YeQpF')
venue_9.photos.attach(io: file, filename: 'chevreuse.png', content_type: 'image/png')
venue_9.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
venue_9.photos.attach(io: file_3, filename: 'nes.png', content_type: 'image/png')
venue_9.save!
puts '8 venue created !'

venue_4 = Venue.new(name: 'Avignon', latitude: '43.9493', longitude: '4.8055', zip: '84000', category: 'Culture', address: 'Avignon', description: 'Avignon, ville de Provence dans le sud-est de la France, est traversée par le Rhône. De 1309 à 1377, les papes catholiques élisent résidence dans la ville. Celle-ci reste sous le règne pontifical jusqu’en 1791, date à laquelle elle est rattachée à la France. Le Palais des Papes, qui se trouve dans le centre-ville, est entouré de remparts médiévaux en pierre et témoigne de cette histoire.')
file = URI.open('https://cdn.generationvoyage.fr/2019/10/vue-sur-le-pont-d-avignon-vue-depuis-le-rhone.jpg')
file_2 = URI.open('https://avignon-tourisme.com/app/uploads/2019/01/EmpreinteDAilleurs-7747.jpg')
file_3 = URI.open('https://upload.wikimedia.org/wikipedia/commons/a/a3/Avignon%2C_Palais_des_Papes_depuis_Tour_Philippe_le_Bel_by_JM_Rosier.jpg')
venue_4.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
venue_4.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
venue_4.photos.attach(io: file_3, filename: 'nes.png', content_type: 'image/png')
venue_4.save!
puts '9 venue created !'

venue_7 = Venue.new(name: "Arènes d'Arles", latitude: '43.6778', longitude: '4.6309', zip: '13200', category: 'Culture', address: "Rond-Point des Arènes, Arles", description: 'Les Arènes d Arles sont un amphithéâtre romain construit vers 80 apr. J.-C. / 90 apr. J.-C. par les ordres de Tibère César Auguste, dans le cadre des extensions flaviennes de la ville.')
file = URI.open('https://cdn.thecrazytourist.com/wp-content/uploads/2016/11/Les-Ar%C3%A8nes-1024x705.jpg')
file_2 = URI.open('https://traveltop6.com/assets/media/places/arenes-darles/_AUTOx800_crop_center-center_none/piryzpqjzhbjucl7uokd.jpg')
file_3 = URI.open('https://img-4.linternaute.com/tGxIs5CyrYyb5BSDMFqaQuYJ8S0=/1240x/smart/e845cf974b384182ad7da14cf615a346/ccmcms-linternaute/11097941.jpg')
venue_7.photos.attach(io: file, filename: 'chateaustger.png', content_type: 'image/png')
venue_7.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
venue_7.photos.attach(io: file_3, filename: 'nes.png', content_type: 'image/png')
venue_7.save!
puts '10 venue created !'

venue_8 = Venue.new(name: 'Musée Picasso', latitude: '43.5808', longitude: '7.1283', zip: '06600', category: 'Culture', address: "Antibes, Juan-Les-Pins", description: 'Le musée Picasso est le musée national français consacré à la vie et à l œuvre de Pablo Picasso ainsi qu aux artistes qui lui furent liés.')
file = URI.open("https://www.francetvinfo.fr/image/75nfocijh-36d4/578/325/19440255.jpg")
file_2 = URI.open('https://www.villa-arson.org/wp-content/uploads/sites/3/2015/09/5619_donation-picasso_antibes-1420x949.jpg')
file_3 = URI.open('https://www.antibesjuanlespins.com/sites/antibes/files/styles/ratio_16_9_xl/public/content/images/terasse_musee_picasso_2008_credit_jean-louis_andral.jpg?itok=2dPp66Tg')
venue_8.photos.attach(io: file, filename: 'vexin.png', content_type: 'image/png')
venue_8.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
venue_8.photos.attach(io: file_3, filename: 'nes.png', content_type: 'image/png')
venue_8.save!
puts '11 venue created !'


# REVIEWS

puts 'Creating reviews...'


review_gv_1 = Review.new(rating: 4, comment: "Grandiose et sauvage (en hiver). Prévoir plusieurs jours de randonnée.")
review_gv_1.user = cecile
review_gv_1.venue = venue_1
review_gv_1.save!

review_gv_2 = Review.new(rating: 3, comment: "C'est un site exceptionnel ! Malheureusement, il y a beaucoup trop de monde en été!")
review_gv_2.user = romain
review_gv_2.venue = venue_1
review_gv_2.save!

review_gv_3 = Review.new(rating: 4, comment: "Endroit paradisiaque où règnent le calme et les cigales")
review_gv_3.user = thomas
review_gv_3.venue = venue_1
review_gv_3.save!

puts 'Creating reviews...'

review_or_1 = Review.new(rating: 3, comment: "À visiter. Dépaysement total. Circuit facile et pratique. À faire en amoureux ou en famille")
review_or_1.user = thomas
review_or_1.venue = venue_2
review_or_1.save!

review_or_2 = Review.new(rating: 3, comment: "C'est juste superbe. Un site magique. On en prend plein les yeux.")
review_or_2.user = romain
review_or_2.venue = venue_2
review_or_2.save!

review_or_3 = Review.new(rating: 4, comment: "En cette sortie de confinement pas bcp de monde balade agréable")
review_or_3.user = cecile
review_or_3.venue = venue_2
review_or_3.save!

puts 'Creating reviews...'

review_pv_1 = Review.new(rating: 5, comment: "Magnifique ! On est venu passer un weekend pour contempler les champs de lavande. A faire au moins une fois dans sa vie.")
review_pv_1.user = romain
review_pv_1.venue = venue_6
review_pv_1.save!

review_pv_2 = Review.new(rating: 3, comment: "Lieu magique avec les vallons aux couleurs de la lavande et des tournesols.")
review_pv_2.user = cecile
review_pv_2.venue = venue_6
review_pv_2.save!

review_pv_3 = Review.new(rating: 5, comment: "Beau mais il faut choisir la bonne saison et le bon moment dans la journée")
review_pv_3.user = thomas
review_pv_3.venue = venue_6
review_pv_3.save!

puts 'Creating reviews...'

review_cc_1 = Review.new(rating: 5, comment: "Belle ballade à faire mais si vous avez le choix, préférable en hors saison.")
review_cc_1.user = cecile
review_cc_1.venue = venue_3
review_cc_1.save!

review_cc_2 = Review.new(rating: 3, comment: "Splendide. sortie à ne pas rater si vous êtes dans le coin. avec la baignade dans les eaux turquoises... juste 100% de plaisir")
review_cc_2.user = romain
review_cc_2.venue = venue_3
review_cc_2.save!

review_cc_3 = Review.new(rating: 4, comment: "C'est génial, les explications pendant la traversée sont bien menees, un agréable moment")
review_cc_3.user = thomas
review_cc_3.venue = venue_3
review_cc_3.save!

puts 'Creating reviews...'

review_p_1 = Review.new(rating: 5, comment: "Sublime prévoir le pique-nique pour profiter des crique")
review_p_1.user = cecile
review_p_1.venue = venue_5
review_p_1.save!

review_p_2 = Review.new(rating: 3, comment: "Beau mais un peu surfait, beaucoup d'algues sur les plages, a vélo c'est très bien")
review_p_2.user = romain
review_p_2.venue = venue_5
review_p_2.save!

# REVIEWS

review_p_3 = Review.new(rating: 4, comment: "C'est il est vraiment magnifique surtout à vélo")
review_p_3.user = thomas
review_p_3.venue = venue_5
review_p_3.save!

puts 'Creating reviews...'

review_pp_1 = Review.new(rating: 5, comment: "Magnifique et calme pour le moment")
review_pp_1.user = cecile
review_pp_1.venue = venue_11
review_pp_1.save!

review_pp_2 = Review.new(rating: 3, comment: "Très belle plage, malheureusement trop de bruit des bars de plage ")
review_pp_2.user = romain
review_pp_2.venue = venue_11
review_pp_2.save!

review_pp_3 = Review.new(rating: 4, comment: "Plage en cours de travaux pour l'été et magnifique hors saison.")
review_pp_3.user = thomas
review_pp_3.venue = venue_11
review_pp_3.save!

puts 'Creating reviews...'

review_tl_1 = Review.new(rating: 5, comment: "Superbe lieu à visiter")
review_tl_1.user = cecile
review_tl_1.venue = venue_10
review_tl_1.save!

review_tl_2 = Review.new(rating: 3, comment: "Quels splendides paysages !")
review_tl_2.user = romain
review_tl_2.venue = venue_10
review_tl_2.save!

review_tl_3 = Review.new(rating: 4, comment: "Beau massif. Vive la nature. A préserver sans modération....")
review_tl_3.user = thomas
review_tl_3.venue = venue_10
review_tl_3.save!

puts 'Creating reviews...'

review_nd_1 = Review.new(rating: 5, comment: "La lumière etait ce jour là autant à l'extérieur qu'à l'intérieur.")
review_nd_1.user = cecile
review_nd_1.venue = venue_9
review_nd_1.save!

review_nd_2 = Review.new(rating: 3, comment: "Très jolie église")
review_nd_2.user = romain
review_nd_2.venue = venue_9
review_nd_2.save!

review_nd_3 = Review.new(rating: 4, comment: "A voir pour le lieu et notre histoire, que l'on soit croyant ou non")
review_nd_3.user = thomas
review_nd_3.venue = venue_9
review_nd_3.save!

puts 'Creating reviews...'

review_av_1 = Review.new(rating: 5, comment: "Super ville je kiffe a fond ")
review_av_1.user = cecile
review_av_1.venue = venue_4
review_av_1.save!

review_av_2 = Review.new(rating: 3, comment: "Grosse deception le pont est cassé !")
review_av_2.user = romain
review_av_2.venue = venue_4
review_av_2.save!

review_av_3 = Review.new(rating: 4, comment: "Le festival d'Avignon est une tuerie de malade oui !")
review_av_3.user = thomas
review_av_3.venue = venue_4
review_av_3.save!

puts 'Creating reviews...'

review_aa_1 = Review.new(rating: 5, comment: "Joli lieu, mais on y pratique la torture!")
review_aa_1.user = cecile
review_aa_1.venue = venue_7
review_aa_1.save!

review_aa_2 = Review.new(rating: 3, comment: "Très belle arène au centre de la belle ville d'Arles ou il est possible de visiter pour la somme de 8€")
review_aa_2.user = romain
review_aa_2.venue = venue_7
review_aa_2.save!

review_aa_3 = Review.new(rating: 4, comment: "Très bien. Quelle grandeur... spectaculaire monument.")
review_aa_3.user = thomas
review_aa_3.venue = venue_7
review_aa_3.save!

puts 'Creating reviews...'

review_mp_1 = Review.new(rating: 5, comment: "Attention : entrée impossible avec une valise, même petite.")
review_mp_1.user = cecile
review_mp_1.venue = venue_8
review_mp_1.save!

review_mp_2 = Review.new(rating: 3, comment: "Réputé et atypique. On aime ou pas mais on ne peut pas  rester insensible. A voir absolument !")
review_mp_2.user = romain
review_mp_2.venue = venue_8
review_mp_2.save!

review_mp_3 = Review.new(rating: 4, comment: "Très beau musée. Super exposition « Tableaux magiques »")
review_mp_3.user = thomas
review_mp_3.venue = venue_8
review_mp_3.save!

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

# PARIS

# venue_1 = Venue.new(name: 'Fondation Claude Monet', latitude: '48.8656', longitude: '2.3789894', zip: '27620', category: 'Monument', address: '84 Rue Claude Monet, 27620 Giverny')
# file = URI.open('https://storage.lebonguide.com/crop-1600x700/52/69/3CF38B80-8C65-4CFB-B802-9816CF460576.png')
# venue_1.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
# venue_1.save!

# venue_2 = Venue.new(name: 'Musée des impressionnismes', latitude: '49.0763478', longitude: '1.5313261', zip: '27620', category: 'Musee', address: '99 Rue Claude Monet, 27620 Giverny')
# file = URI.open('https://www.aleou.fr/images/etablissements/2728/max/img_5278_7324.jpg')
# venue_2.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
# venue_2.save!

# venue_12 = Venue.new(name: 'Tour du Luberon', latitude: '43.7961', longitude: '5.2239', zip: '84240', category: 'Velo', address: 'Massif du Luberon', description: 'Villages perchés, bories, châteaux, monuments, mais aussi falaises et garrigues.. autant de richesses regroupées sur un seul territoire.')
# file = URI.open('https://www.lagrande-verriere.com/wp-content/uploads/2018/11/luberon-provence-idees-sorties-villages-tourisme-2.jpg')
# venue_12.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
# venue_12.save!

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
