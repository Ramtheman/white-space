# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Space.destroy_all
User.destroy_all

testers = [
  ["Rami", "Assaf", "ramiw.assaf@gmail.com", 'password'],
  ["Simon", "Foster", "simonfos74@gmail.com", 'password'],
  ["Will", "Holmes", "willholmes60@gmail.com", 'password'],
  ["Mark", "de Courcy Ling", "m.decourcyling@gmail.com", 'password']
]

postcodes = ['BR1 1AJ', 'SW8 2AA', 'NW1W 9UL', 'NW2 5TH', 'E2 0RT',
              'E2 2DW', 'EC4M 7BU', 'N16 8LU', 'N16 8NW', 'NW1 9EL',
              'NW6 3BR', 'NW1W 7YG', 'NW8 7DN', 'UB7 8PG', 'W10 5BG',
              'W12 9AP', 'W1S 1BBR', 'W1U 1BW', 'W1T 7RQ', 'E1 6EB']

spaces = ['Face paint', 'Bathroom stall', 'Tattoo', 'Manhole', 'Legal name', 'Oyster card']

testers.each do |tester|
  person = User.new(first_name: tester[0], last_name: tester[1], email: tester[2], password: tester[3])
  person.save
  5.times do
    title = Faker::Company.name
    space_type = spaces.sample
    postcode_instance = postcodes.sample
    postcodes.delete(postcode_instance)
    price = rand(1000)
    space = Space.new(title: title, space_type: space_type, price: price, location: postcode_instance)
    space.user = person
    space.save
  end
end
