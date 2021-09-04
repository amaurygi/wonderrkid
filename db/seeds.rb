# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

User.destroy_all
Chatroom.destroy_all

puts 'Creating fake users...'

pictures = [
  'https://www.foottheball.com/wp-content/uploads/2019/10/Teens-Who-Participate-In-Football.jpg',
  'https://previews.123rf.com/images/ammentorp/ammentorp1709/ammentorp170900520/86819500-teenagers-playing-football-on-field-soccer-team-practicing-on-football-ground-.jpg',
  'https://yourteenmag.com/wp-content/uploads/2020/07/return-to-field-1-1135x540.jpg',
  'https://c8.alamy.com/comp/TWH5RF/teenagers-playing-informal-soccer-football-TWH5RF.jpg',
  'https://www.esquireme.com/public/images/2017/04/06/8758160_orig.jpg',
  'https://www.abcmoney.co.uk/wp-content/uploads/2017/11/football.jpg',
  'https://welshbattlefields.org.uk/wp-content/uploads/2020/06/px-teens-sports-1568x1045.jpeg'
]

file = URI.open('https://www.usyouthsoccer.org/assets/1/6/f-17-65-6653354_Andrea1.jpg')
user = User.new(
  email: 'michel@mail.com', 
  password: '123456', 
  first_name:"Michel", 
  last_name:"Caluwaerts",
  role: "Athlete",
  sport: "Football",
  position: Faker::Sports::Football.position,
  gender: ['Male', 'Female'].sample,
  footedness: ['Left', 'Right'].sample,
  weight: rand(50..100),
  height: rand(120..200),
  description: Faker::Quote.yoda,
)
user.avatar.attach(io: file, filename: 'michel.jpg', content_type: 'image/jpg')
user.save!

file = URI.open('https://www.active.com/Assets/active-family/football/health-benefits.jpg')
user = User.new(
  email: 'amaury@mail.com', 
  password: '123456', 
  first_name:"Amaury", 
  last_name:"Gilliot",
  role: "Athlete",
  sport: "Football",
  position: Faker::Sports::Football.position,
  gender: ['Male', 'Female'].sample,
  footedness: ['Left', 'Right'].sample,
  weight: rand(50..100),
  height: rand(120..200),
  description: Faker::Quote.yoda,
)
user.avatar.attach(io: file, filename: 'amaury.jpg', content_type: 'image/jpg')
user.save!

file = URI.open('https://thumbs.dreamstime.com/z/action-sport-picture-group-kids-playing-soccer-football-exercise-community-rural-area-field-under-sunset-ligth-134991448.jpg')
user = User.new(
  email: 'ivo@mail.com', 
  password: '123456', 
  first_name:"Ivo", 
  last_name:"Rasovic",
  role: "Athlete",
  sport: "Football",
  position: Faker::Sports::Football.position,
  gender: ['Male', 'Female'].sample,
  footedness: ['Left', 'Right'].sample,
  weight: rand(50..100),
  height: rand(120..200),
  description: Faker::Quote.yoda,
)
user.avatar.attach(io: file, filename: 'ivo.jpg', content_type: 'image/jpg')
user.save!

User.take(3).each do |user|
  pictures.each do |picture|
    file = URI.open(picture)
    user.photos.attach(io: file, filename: "photo #{pictures[10..13]}", content_type: 'image/jpg')
    user.save!
  end
end

=begin
User.take(2).each do |user|
  p user
  2.times { |_| user.follower_relationships.create(followed_user_id: User.where.not(id: user.id).sample) }
end
=end
connection = FollowerRelationship.new(user: User.first, followed_user: User.last)
chatroom = Chatroom.create
connection.chatroom = chatroom
connection.save

puts 'Finished!'
