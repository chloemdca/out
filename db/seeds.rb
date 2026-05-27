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

Venue.create!([
  {
   name: "Little Red Door",
    category: "Bar",
    lat: 48.8579,
    lng: 2.3665
  },
  {
    name: "Candelaria",
    category: "Bar",
    lat: 48.8640,
    lng: 2.3506
  },
  {
    name: "Experimental Cocktail Club",
    category: "Bar",
    lat: 48.8654,
    lng: 2.3431
  },
  {
    name: "Harry's New York Bar",
    category: "Bar",
    lat: 48.8687,
    lng: 2.3285
  },
  {
    name: "Le Comptoir du Relais",
    category: "Restaurant",
    lat: 48.8536,
    lng: 2.3386
  },
  {
    name: "Septime",
    category: "Restaurant",
    lat: 48.8530,
    lng: 2.3808
  },
  {
    name: "Bistrot Paul Bert",
    category: "Restaurant",
    lat: 48.8567,
    lng: 2.3842
  },
  {
    name: "Chez L’Ami Jean",
    category: "Restaurant",
    lat: 48.8587,
    lng: 2.3081
  },
  {
    name: "Pink Mamma",
    category: "Restaurant",
    lat: 48.8839,
    lng: 2.3374
  },
  {
    name: "Café de Flore",
    category: "Cafe",
    lat: 48.8553,
    lng: 2.3332
  },
  {
    name: "Les Deux Magots",
    category: "Cafe",
    lat: 48.8546,
    lng: 2.3330
  },
  {
    name: "Coutume Café",
    category: "Cafe",
    lat: 48.8506,
    lng: 2.3096
  },
  {
    name: "Fragments",
    category: "Cafe",
    lat: 48.8662,
    lng: 2.3622
  },
  {
    name: "Holybelly",
    category: "Cafe",
    lat: 48.8722,
    lng: 2.3570
  }
])

puts "Created venues!"

User.create!(
  email: "test@test.com",
  password: "password",
  user_alias: "testuser",
  first_name: "Test",
  last_name: "User"
)

puts "Created test user!"
