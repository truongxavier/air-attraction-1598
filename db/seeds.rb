# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

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

user_elon = User.create!(
  email: 'elon@test.com',
  password: '123456',
  password_confirmation: '123456',
  username: 'Elon Musk'
)

user_jeff = User.create!(
  email: 'jeff@test.com',
  password: '123456',
  password_confirmation: '123456',
  username: 'Jeff Besos'
)

user_bill = User.create!(
  email: 'bill@test.com',
  password: '123456',
  password_confirmation: '123456',
  username: 'Bill Gates'
)

user_mark = User.create!(
  email: 'mark@test.com',
  password: '123456',
  password_confirmation: '123456',
  username: 'Mark Zuckerberg'
)

user_bernard = User.create!(
  email: 'bernard@test.com',
  password: '123456',
  password_confirmation: '123456',
  username: 'Bernard Arnault'
)

puts 'création des parks'

park_ocean = Park.new(
  name: "marvelous ocean's park",
  park_description: "Plongez dans l'aventure avec le Parc d'Attractions Sous-Marin ! 🌊 Imaginez un monde où vous pouvez nager avec les dauphins, explorer des récifs coralliens colorés, et découvrir des créatures marines mystérieuses, tout cela sous 2000 mètres de profondeur. Bienvenue au Parc d'Attractions Sous-Marin, le premier de son genre, situé sous les vagues scintillantes de l'océan.",
  chambers_description: "Imaginez-vous endormir sous un ciel étoilé d'anémones de mer scintillantes et vous réveiller au spectacle des dauphins jouant dans les eaux turquoise. Nos chambres somptueuses offrent une expérience sous-marine inégalée qui transcende l'ordinaire. Chaque chambre est un chef-d'œuvre d'architecture et de design, avec des murs de verre offrant une vue panoramique sur l'océan et sa vie marine fascinante. Les intérieurs sont conçus avec un sens du luxe et du confort, avec des lits douillets, des salles de bains modernes et toutes les commodités modernes pour rendre votre séjour aussi confortable que possible",
  restaurants_description: "Mais ce n'est pas tout ! Notre parc est également équipé de restaurants sous-marins où vous pouvez déguster des délices culinaires tout en admirant la vue panoramique de l'océan.",
  location: "océan indien",
  price: 10_000
)
park_ocean.user = user_elon
park_ocean.save!
