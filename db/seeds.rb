# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Space.destroy_all
User.destroy_all
require 'open-uri'

testers = [
  { first_name: "Rami", last_name: "Assaf", email: "ramiw.assaf@gmail.com", password: 'password' },
  { first_name: "Simon", last_name: "Foster", email: "simonfos74@gmail.com", password: 'password' },
  { first_name: "Will", last_name: "Holmes", email: "willholmes60@gmail.com", password: 'password' },
  { first_name: "Mark", last_name: "de Courcy Ling", email: "m.decourcyling@gmail.com", password: 'password' },
]

# creating first user and two spaces
rami = User.new(testers[0])
rami.save
face_tat = Space.new(title: 'My face', space_type: 'Tattoo', price: 1000, location: 'E1 6EB')
face_tat.user = rami
face_tat.photo.attach(io: URI.open('https://res.cloudinary.com/dga79fsx2/image/upload/v1637249170/askc4gp0uz0qsnl4dhu0.jpg'), filename: "tattoo.jpg", content_type: 'image/jpg')
face_tat.save
car_ad = Space.new(title: 'Post your ad on my car', space_type: 'Car sticker', price: 500, location: 'E2 8DY')
car_ad.user = rami
car_ad.photo.attach(io: URI.open('https://res.cloudinary.com/dga79fsx2/image/upload/v1637249145/qynif36yd83r7mjln29w.jpg'), filename: "car.jpg", content_type: 'image/jpg')
car_ad.save

# creating second user and two spaces
simon = User.new(testers[1])
simon.save
name_change = Space.new(title: 'I will change my name to your brand!', space_type: 'Legal name change', price: 2000, location: 'W1U 1BW')
name_change.user = simon
name_change.photo.attach(io: URI.open('https://res.cloudinary.com/dga79fsx2/image/upload/v1637249155/y2drw4kslh3m79petinb.jpg'), filename: "mclovin.jpg", content_type: 'image/jpg')
name_change.save

# creating third user and two spaces
will = User.new(testers[2])
will.save
bagpack = Space.new(title: 'Stylize my bagpack with your ad', space_type: 'Bagpack', price: 200, location: 'WC1E 6JW')
bagpack.user = will
bagpack.photo.attach(io: URI.open('https://res.cloudinary.com/dga79fsx2/image/upload/v1637249134/tjbheomfjhlpaabo1ace.jpg'), filename: "bagpack.jpg", content_type: 'image/jpg')
bagpack.save

# creating last user and two spaces
mark = User.new(testers[3])
mark.save
lawn = Space.new(title: "My lawn is the perfect place for your marketing", space_type: 'Front lawn', price: 500, location: 'NW6 3BR')
lawn.user = mark
lawn.photo.attach(io: URI.open('https://res.cloudinary.com/dga79fsx2/image/upload/v1637249162/v1uhpod7ucesilm4sbvm.jpg'), filename: "lawn.jpg", content_type: 'image/jpg')
lawn.save
