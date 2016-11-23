# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do 
list = Listing.create(
 max_occupants: rand(1..10) ,
 city: FFaker::Address.city ,
 address: FFaker::Address.street_address ,
 price: rand(1000..10000).to_f ,
 availability: true ,
 description: FFaker::Tweet.body,
 number_of_bathrooms: (1..4),
 number_of_bedrooms: (1..4),
)
end