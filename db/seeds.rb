# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all

user1 = User.create(email: 'test@mail.com', password: '123456', first_name:"Michel", last_name:"Caluwaerts")
user2 = User.create(email: 'test2@mail.com', password: '123456', first_name:"Ivo", last_name:"Rasovic")
user3 = User.create(email: 'test3@mail.com', password: '123456', first_name:"Amaury", last_name:"Gilliot", sport:"Football", position:"Midfield", gender:"Male", footedness:"Right", weight:69, height:172)

puts 'Creating 20 fake users...'
20.times do
  user = User.new(
    first_name: Faker::Name::first_name,
    last_name: Faker::Name::name,
    email: Faker::Internet::email,
    password: "123456",
    sport: "Football",
    position: Faker::Sports::Football.position,
    gender: ['Male', 'Female'].sample,
    footedness: ['Left', 'Right'].sample,
    weight: rand(50..100),
    height: rand(120..200),
    description: Faker::Quote.yoda,
    follower_relationships
  )
  user.save!
end
puts 'Finished!'
