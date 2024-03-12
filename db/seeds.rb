# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'open-uri'

puts 'nettoyage de la base'

puts 'nettoyage ParkReview'
ParkReview.destroy_all
puts 'nettoyage Rental'
Rental.destroy_all
puts 'nettoyage Park'
Park.destroy_all
puts 'nettoyage User'
User.destroy_all

puts 'création des users'

user_elon = User.new(
  email: 'elon@test.com',
  password: '123456',
  password_confirmation: '123456',
  username: 'Elon Musk'
)
file = URI.open('https://res.cloudinary.com/dk7qaea1j/image/upload/v1710266139/air-attraction/milliardaires/Elon-Musk-5-Things-to-Know-Ahead-His-SNL-Hosting-Debut-004_oyiuzh.webp')
name = "elon.jpeg"
user_elon.photo.attach(io: file, filename: name, content_type: "image/png")
user_elon.save!

user_jeff = User.new(
  email: 'jeff@test.com',
  password: '123456',
  password_confirmation: '123456',
  username: 'Jeff Besos'
)
file = URI.open('https://res.cloudinary.com/dk7qaea1j/image/upload/v1710266142/air-attraction/milliardaires/jeff_zdlhtz.jpg')
name = "jeff.jpeg"
user_jeff.photo.attach(io: file, filename: name, content_type: "image/png")
user_jeff.save!

user_bill = User.new(
  email: 'bill@test.com',
  password: '123456',
  password_confirmation: '123456',
  username: 'Bill Gates'
)
file = URI.open('https://res.cloudinary.com/dk7qaea1j/image/upload/v1710266138/air-attraction/milliardaires/biografi_bill_gates_-_cepatlambat_uz0bxa.jpg')
name = "bill.jpeg"
user_bill.photo.attach(io: file, filename: name, content_type: "image/png")
user_bill.save!

user_mark = User.new(
  email: 'mark@test.com',
  password: '123456',
  password_confirmation: '123456',
  username: 'Mark Zuckerberg'
)
file = URI.open('https://res.cloudinary.com/dk7qaea1j/image/upload/v1710266144/air-attraction/milliardaires/mark_yiktef.jpg')
name = "mark.jpeg"
user_mark.photo.attach(io: file, filename: name, content_type: "image/png")
user_mark.save!

user_bernard = User.new(
  email: 'bernard@test.com',
  password: '123456',
  password_confirmation: '123456',
  username: 'Bernard Arnault'
)
file = URI.open('https://res.cloudinary.com/dk7qaea1j/image/upload/v1710266136/air-attraction/milliardaires/bernard_iekoiw.webp')
name = "bernard.jpeg"
user_bernard.photo.attach(io: file, filename: name, content_type: "image/png")
user_bernard.save!

puts 'création des parks'

puts 'park ocean'
park_ocean = Park.new(
  name: "marvelous ocean's park",
  park_description: "Plongez dans l'aventure avec le Parc d'Attractions Sous-Marin ! 🌊 Imaginez un monde où vous pouvez nager avec les dauphins, explorer des récifs coralliens colorés, et découvrir des créatures marines mystérieuses, tout cela sous 2000 mètres de profondeur. Bienvenue au Parc d'Attractions Sous-Marin, le premier de son genre, situé sous les vagues scintillantes de l'océan.",
  chambers_description: "Imaginez-vous endormir sous un ciel étoilé d'anémones de mer scintillantes et vous réveiller au spectacle des dauphins jouant dans les eaux turquoise. Nos chambres somptueuses offrent une expérience sous-marine inégalée qui transcende l'ordinaire. Chaque chambre est un chef-d'œuvre d'architecture et de design, avec des murs de verre offrant une vue panoramique sur l'océan et sa vie marine fascinante. Les intérieurs sont conçus avec un sens du luxe et du confort, avec des lits douillets, des salles de bains modernes et toutes les commodités modernes pour rendre votre séjour aussi confortable que possible",
  restaurants_description: "Mais ce n'est pas tout ! Notre parc est également équipé de restaurants sous-marins où vous pouvez déguster des délices culinaires tout en admirant la vue panoramique de l'océan.",
  location: "océan indien",
  price: 10_000
)
park_ocean.user = user_elon

images_to_upload = ['https://res.cloudinary.com/dk7qaea1j/image/upload/v1710258442/air-attraction/oceans/park4_vc6wxz.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710258441/air-attraction/oceans/park3_pfztnl.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710258439/air-attraction/oceans/park2_uayu68.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710258438/air-attraction/oceans/park1_zkhsfs.jpg']
count = 0
images_to_upload.each do |image_url|
  count += 1
  file = URI.open(image_url)
  name = "park#{count}.jpeg"
  park_ocean.park_photos.attach(io: file, filename: name, content_type: "image/png")
end
images_to_upload = ['https://res.cloudinary.com/dk7qaea1j/image/upload/v1710258437/air-attraction/oceans/chamber3_yhhjmi.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710258438/air-attraction/oceans/chamber4_dk9ypf.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710258436/air-attraction/oceans/chamber2_epkwvy.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710258436/air-attraction/oceans/chamber1_o4u6ow.jpg']
count = 0
images_to_upload.each do |image_url|
  count += 1
  file = URI.open(image_url)
  name = "chamber#{count}.jpeg"
  park_ocean.chambers_photos.attach(io: file, filename: name, content_type: "image/png")
end

images_to_upload = ['https://res.cloudinary.com/dk7qaea1j/image/upload/v1710258445/air-attraction/oceans/retaurant4_pylibl.jpg',
  'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710258444/air-attraction/oceans/retaurant3_jjtpzc.jpg',
  'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710258443/air-attraction/oceans/retaurant2_i8mlwr.jpg',
  'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710258442/air-attraction/oceans/retaurant1_deaaut.jpg']
count = 0
images_to_upload.each do |image_url|
count += 1
file = URI.open(image_url)
name = "restaurant#{count}.jpeg"
park_ocean.restaurants_photos.attach(io: file, filename: name, content_type: "image/png")
end

park_ocean.save!

puts 'park espace'
park_espace = Park.new(
  name: "incredible OrbitalPark",
  park_description: "Imaginez un lieu où les étoiles ne sont pas seulement au-dessus de vous, mais tout autour. OrbitaParc, la première station spatiale de loisirs, vous invite à vivre une expérience inoubliable en orbite autour de la Terre. Flottez en apesanteur, dansez sous les aurores boréales et dormez sous un dôme transparent avec vue sur l'infini. Venez toucher l'univers du bout des doigts et repoussez les frontières de l'amusement. OrbitaParc, là où les rêves deviennent réalité parmi les étoiles. 🌌✨",
  chambers_description: "Découvrez le luxe infini d'OrbitaParc, où chaque chambre est une fenêtre sur l'univers. Nos suites spacieuses offrent une vue imprenable sur la Terre et les étoiles, avec des commodités de première classe pour assurer votre confort et votre sécurité. Imaginez-vous vous endormir sous un ciel étoilé et vous réveiller avec le lever du soleil sur la planète bleue. OrbitaParc, l'expérience spatiale ultime où vos rêves parmi les étoiles deviennent réalité. 🚀✨",
  restaurants_description: "Savourez une gastronomie étoilée à OrbitaParc, où chaque repas est une célébration de l'innovation culinaire et de la beauté céleste. Nos restaurants luxueux vous proposent des plats exquis préparés par des chefs de renom, dans un cadre où chaque fenêtre offre une vue spectaculaire sur la Terre qui défile. Dînez au-delà des étoiles et vivez une expérience sensorielle unique, où le goût et la vue se mêlent à l'apesanteur. OrbitaParc, une aventure gastronomique inoubliable au cœur de l'espace. 🌟🍽️✨",
  location: "océan pacifique",
  price: 200_000
)
park_espace.user = user_jeff

images_to_upload = ['https://res.cloudinary.com/dk7qaea1j/image/upload/v1710262325/air-attraction/espace/park4_k27fi6.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710262323/air-attraction/espace/park3_nmqxav.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710262322/air-attraction/espace/park2_t5dhfq.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710262320/air-attraction/espace/park1_xnt83m.jpg']
count = 0
images_to_upload.each do |image_url|
  count += 1
  file = URI.open(image_url)
  name = "park#{count}.jpeg"
  park_espace.park_photos.attach(io: file, filename: name, content_type: "image/png")
end
images_to_upload = ['https://res.cloudinary.com/dk7qaea1j/image/upload/v1710262319/air-attraction/espace/chamber4_uccehx.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710262318/air-attraction/espace/chamber3_vcmyfc.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710262317/air-attraction/espace/chamber2_nspjwq.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710262316/air-attraction/espace/chamber1_e1h86p.jpg']
count = 0
images_to_upload.each do |image_url|
  count += 1
  file = URI.open(image_url)
  name = "chamber#{count}.jpeg"
  park_espace.chambers_photos.attach(io: file, filename: name, content_type: "image/png")
end

images_to_upload = ['https://res.cloudinary.com/dk7qaea1j/image/upload/v1710262330/air-attraction/espace/restaurant4_iuffpn.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710262329/air-attraction/espace/restaurant3_xbsby3.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710262327/air-attraction/espace/restaurant2_f95jbt.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710262326/air-attraction/espace/restaurant1_cs20x3.jpg']
count = 0
images_to_upload.each do |image_url|
count += 1
file = URI.open(image_url)
name = "restaurant#{count}.jpeg"
park_espace.restaurants_photos.attach(io: file, filename: name, content_type: "image/png")
end

park_espace.save!

puts 'park jungle'
park_jungle = Park.new(
  name: "Sublime Amazonia Parc",
  park_description: "Plongez dans l'aventure au cœur de la jungle luxuriante d'Amazonia Parc! Découvrez des attractions palpitantes cachées parmi les arbres centenaires et les lianes mystérieuses. Écoutez le rugissement des cascades et le chant des oiseaux exotiques tout en explorant des mondes perdus. Amazonia Parc, l'évasion ultime pour les aventuriers de tous âges. Osez l'aventure, vivez la légende! 🌿🐒🎢",
  chambers_description: "Évadez-vous dans l'écrin de verdure d'Amazonia Parc et reposez-vous dans nos chambres luxueuses, nichées au cœur de la jungle. Laissez-vous bercer par les sons apaisants de la nature tout en profitant du confort moderne et d'un service exceptionnel. Nos suites, véritables havres de paix, vous offrent une immersion totale dans un cadre exotique et raffiné. Amazonia Parc, où le luxe rencontre l'aventure. 🌴✨🛏️",
  restaurants_description: "Au cœur de la jungle mystérieuse, Amazonia Parc vous invite à un festin sensoriel inoubliable. Nos restaurants luxueux, perchés dans les arbres, offrent une cuisine raffinée aux saveurs exotiques. Dégustez des plats élaborés avec les trésors de la forêt, dans un cadre où la nature s'invite à votre table. Amazonia Parc, l'expérience culinaire qui éveille l'aventurier gourmet en vous. 🍃🍴✨",
  location: "Amazonie",
  price: 150_000
)
park_jungle.user = user_jeff

images_to_upload = ['https://res.cloudinary.com/dk7qaea1j/image/upload/v1710263469/air-attraction/jungle/park4_csm8zw.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710263467/air-attraction/jungle/park3_lvgiyz.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710263466/air-attraction/jungle/park2_ymumcw.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710263464/air-attraction/jungle/park1_fuoquj.jpg']
count = 0
images_to_upload.each do |image_url|
  count += 1
  file = URI.open(image_url)
  name = "park#{count}.jpeg"
  park_jungle.park_photos.attach(io: file, filename: name, content_type: "image/png")
end
images_to_upload = ['https://res.cloudinary.com/dk7qaea1j/image/upload/v1710263462/air-attraction/jungle/chamber4_z0vbxs.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710263460/air-attraction/jungle/chamber3_ft2uny.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710263459/air-attraction/jungle/chamber2_zzs5cd.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710263458/air-attraction/jungle/chamber1_vhwhdg.jpg']
count = 0
images_to_upload.each do |image_url|
  count += 1
  file = URI.open(image_url)
  name = "chamber#{count}.jpeg"
  park_jungle.chambers_photos.attach(io: file, filename: name, content_type: "image/png")
end

images_to_upload = ['https://res.cloudinary.com/dk7qaea1j/image/upload/v1710263476/air-attraction/jungle/restaurant4_n2xbzw.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710263474/air-attraction/jungle/restaurant3_fbquwp.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710263472/air-attraction/jungle/restaurant2_mlibem.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710263471/air-attraction/jungle/restaurant1_xexpls.jpg']
count = 0
images_to_upload.each do |image_url|
count += 1
file = URI.open(image_url)
name = "restaurant#{count}.jpeg"
park_jungle.restaurants_photos.attach(io: file, filename: name, content_type: "image/png")
end

park_jungle.save!

puts 'park Desert'
park_desert = Park.new(
  name: "Monstruous Desert Parc",
  park_description: "Découvrez l'Oasis des Aventuriers!🌵 Au cœur du désert, un monde d'aventures vous attend! 🎢Venez vivre l'expérience ultime dans un parc d'attraction unique où le frisson de la vitesse rencontre la majesté des dunes. À l'Oasis des Aventuriers, chaque manège est une épopée, chaque attraction une découverte.",
  chambers_description: "Évasion Nocturne à l'Oasis des Rêves!🌟 Après une journée d'aventures, reposez-vous sous les étoiles du désert. 🛏️ À l'Oasis des Rêves, chaque chambre est un sanctuaire de confort au milieu des sables. Imaginez-vous endormi sous un ciel étoilé, dans une chambre conçue pour refléter la beauté mystique du déser",
  restaurants_description: "Savourez l'Aventure à la Table des Mirages!🍴 Découvrez les délices culinaires au cœur du désert enchanté. 🌴 Au parc d'attraction des Dunes Enchantées, nos restaurants vous invitent à un voyage gastronomique inoubliable. Laissez-vous transporter par des saveurs exotiques dans un cadre époustouflant où le sable rencontre les étoiles.",
  location: "désert du Sahara",
  price: 75_000
)
park_desert.user = user_bill

images_to_upload = ['https://res.cloudinary.com/dk7qaea1j/image/upload/v1710269051/air-attraction/desert/park1_sanell.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710269053/air-attraction/desert/park2_tkomyd.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710269056/air-attraction/desert/park3_lcgupk.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710269058/air-attraction/desert/park4_qsapwr.jpg']
count = 0
images_to_upload.each do |image_url|
  count += 1
  file = URI.open(image_url)
  name = "park#{count}.jpeg"
  park_desert.park_photos.attach(io: file, filename: name, content_type: "image/png")
end
images_to_upload = ['https://res.cloudinary.com/dk7qaea1j/image/upload/v1710269049/air-attraction/desert/chambre4_od9bt8.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710269046/air-attraction/desert/chambre3_ntmta3.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710269044/air-attraction/desert/chambre2_up5pdy.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710269042/air-attraction/desert/chambre1_efa4it.jpg']
count = 0
images_to_upload.each do |image_url|
  count += 1
  file = URI.open(image_url)
  name = "chamber#{count}.jpeg"
  park_desert.chambers_photos.attach(io: file, filename: name, content_type: "image/png")
end

images_to_upload = ['https://res.cloudinary.com/dk7qaea1j/image/upload/v1710269068/air-attraction/desert/restaurant4_i8rqsf.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710269065/air-attraction/desert/restaurant3_v7p9is.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710269063/air-attraction/desert/restaurant2_gg1kce.jpg',
                    'https://res.cloudinary.com/dk7qaea1j/image/upload/v1710269061/air-attraction/desert/restaurant1_wkmzlx.jpg']
count = 0
images_to_upload.each do |image_url|
count += 1
file = URI.open(image_url)
name = "restaurant#{count}.jpeg"
park_desert.restaurants_photos.attach(io: file, filename: name, content_type: "image/png")
end

park_desert.save!

puts 'création rentals ocean'
ocean_rental_01 = Rental.new(
  arrival_date: DateTime.strptime("22/03/2024", "%d/%m/%Y"),
  departure_date: DateTime.strptime("27/03/2024", "%d/%m/%Y"),
  visitors_number: 22
)
ocean_rental_01.park = park_ocean
ocean_rental_01.user = user_bill
ocean_rental_01.save

ocean_rental_02 = Rental.new(
  arrival_date: DateTime.strptime("05/04/2024", "%d/%m/%Y"),
  departure_date: DateTime.strptime("12/04/2024", "%d/%m/%Y"),
  visitors_number: 15
)
ocean_rental_02.park = park_ocean
ocean_rental_02.user = user_bernard
ocean_rental_02.save

puts 'création reviews rentals ocean'
review_ocean_01 = ParkReview.new(
  comment: "pour l'instant une expèrience inoubliable",
  rating: 5
)
review_ocean_01.rental = ocean_rental_01
review_ocean_01.save!

review_ocean_02 = ParkReview.new(
  comment: "c'est juste complètement fou",
  rating: 5
)
review_ocean_02.rental = ocean_rental_02
review_ocean_02.save!
