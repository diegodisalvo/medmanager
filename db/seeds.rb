# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

25.times do
  Patient.create(
    fname: Faker::Name.first_name,
    lname: Faker::Name.last_name,
    birth_date: Faker::Date.birthday(1, 90),
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    province: Faker::Address.state_abbr,
    fiscalcode: Faker::IDNumber.valid
  )
end
