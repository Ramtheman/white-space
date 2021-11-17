# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.destroy_all
Space.destroy_all

testers = [
  ["Rami", "Assaf", "ramiw.assaf@gmail.com", 'password'],
  ["Simon", "Foster", "simonfos74@gmail.com", 'password'],
  ["Will", "Holmes", "willholmes60@gmail.com", 'password'],
  ["Mark", "de Courcy Ling", "m.decourcyling@gmail.com", 'password']
]

testers.each do |tester|
  person = User.new(first_name: tester[0], last_name: tester[1], email: tester[2], password: tester[3])
  person.save
  5.times do
    title = Faker::Company.name
    typo = Faker::Company.bs
    location = Faker::Address.country
    price = rand(1000)
    space = Space.new(title: title, space_type: typo, price: price, location: location)
    space.user = person
    space.save
  end
end
