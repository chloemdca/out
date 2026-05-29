# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database.."
Venue.destroy_all
User.destroy_all
List.destroy_all
Log.destroy_all

venues = Venue.create!([
  {
   name: "Little Red Door",
    category: "bar",
    lat: 48.8579,
    lng: 2.3665
  },
  {
    name: "Candelaria",
    category: "bar",
    lat: 48.8640,
    lng: 2.3506
  },
  {
    name: "Experimental Cocktail Club",
    category: "bar",
    lat: 48.8654,
    lng: 2.3431
  },
  {
    name: "Harry's New York Bar",
    category: "bar",
    lat: 48.8687,
    lng: 2.3285
  },
  {
    name: "Le Comptoir du Relais",
    category: "restaurant",
    lat: 48.8536,
    lng: 2.3386
  },
  {
    name: "Septime",
    category: "restaurant",
    lat: 48.8530,
    lng: 2.3808
  },
  {
    name: "Bistrot Paul Bert",
    category: "restaurant",
    lat: 48.8567,
    lng: 2.3842
  },
  {
    name: "Chez L’Ami Jean",
    category: "restaurant",
    lat: 48.8587,
    lng: 2.3081
  },
  {
    name: "Pink Mamma",
    category: "restaurant",
    lat: 48.8839,
    lng: 2.3374
  },
  {
    name: "Café de Flore",
    category: "cafe",
    lat: 48.8553,
    lng: 2.3332
  },
  {
    name: "Les Deux Magots",
    category: "cafe",
    lat: 48.8546,
    lng: 2.3330
  },
  {
    name: "Coutume Café",
    category: "cafe",
    lat: 48.8506,
    lng: 2.3096
  },
  {
    name: "Fragments",
    category: "cafe",
    lat: 48.8662,
    lng: 2.3622
  },
  {
    name: "Holybelly",
    category: "cafe",
    lat: 48.8722,
    lng: 2.3570
  }
])

puts "Created venues!"

user = User.create!(
  email: "test@test.com",
  password: "password",
  user_alias: "testuser",
  first_name: "Test",
  last_name: "User"
)

puts "Created test user!"

musttry = List.create!(user: user, name: "Must Try")
favourites = List.create!(user: user, name: "Favourites")

venues.sample(2).each do |venue|
  ListVenue.create!(list: musttry, venue: venue)
  ListVenue.create!(list: favourites, venue: venue)
end

puts "Lists created!"

Log.create!(
  user: user,
  venue: venues[2],
  rating: 3,
  comment: "Decent but nothing special.",
  date_visited: Date.new(2026, 4, 20)
)

Log.create!(
  user: user,
  venue: venues[3],
  rating: 2,
  comment: "Service was slow, food was okay.",
  date_visited: Date.new(2026, 5, 1)
)

Log.create!(
  user: user,
  venue: venues[4],
  rating: 5,
  comment: "Absolutely stunning place, will be back!",
  date_visited: Date.new(2026, 5, 10)
)
puts "Logs created!"
