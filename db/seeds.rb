# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do
  Driver.create(
    email: Faker::Internet.email,
    name: Faker::Name.name ,
    city: Faker::Address.city,
    phone_number: Faker::PhoneNumber.phone_number,
    available: true
  )
end
Trip.create(city: Faker::Address.city, status: 0, driver_id: 1)
Trip.create(city: Faker::Address.city, status: 0, driver_id: 1)
FullTrip.create(city: Faker::Address.city, longitude: 29.9797513, latitude: 32.5434502, trip_id: 1)
