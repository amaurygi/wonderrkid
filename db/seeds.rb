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
  'https://www.abcmoney.co.uk/wp-content/uploads/2017/11/football.jpg'
]

quote = [
  "Hi, I'm a football player looking for an academy where I can improve my skills, and hopefully sign a contract in one of the big european leagues.",
  "I'm a hard worker, with an incredible passion for football. I pay attention to my nutrition and my resting habits as well. My dream is to play in the premier league.",
  "I currently play for a good second tier team, but I'd love to move up to the big leagues. My dream is to represent my country at the world cup.",
  "I am young athlete dreaming to become professional football player and make career as my idol Cristiano Ronaldo. I can shoot with both my legs and am very fast. Check it on my highlights. :)",
  "Hi there! Please check out my videos, and let me know what do you think about my skills. I am looking for academy, so feel free to contact me if you find my profile interesting.",
  "I am member of local academy but would like to take my career on the next level. I train so hard to win Champions League one day, hopefully with AS Roma.",
  "My dream is to play with my idol Lionel Messi in the French league.",
  "As a hopeful football player, my goal is to play for a big South American club.",
  "I work very hard to make my dreams come true. I hope to become a professional player and provide for my family."
]

file = URI.open('https://www.usyouthsoccer.org/assets/1/6/f-17-65-6653354_Andrea1.jpg')
user = User.new(
  email: 'michel@mail.com', 
  password: '123456', 
  first_name:"Michel", 
  last_name:"Caluwaerts",
  role: "Athlete",
  sport: "Football",
  position: "Goalkeeper",
  gender: ['Male'].sample,
  footedness: ['Left'].sample,
  weight: 70,
  height: 177,
  description: quote.sample,
  nationality: "Belgium",
  city: "Uccle",
  age: "52"
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
  position: "Offensive Midfielder",
  gender: ['Male'].sample,
  footedness: ['Right'].sample,
  weight: 69,
  height: 172,
  description: quote.sample,
  nationality: "Belgium",
  city: "Waterloo",
  age: "30"
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
  position: "Striker",
  gender: ['Male'].sample,
  footedness: ['Right'].sample,
  weight: 66,
  height: 170,
  description: "Hello everyone! I am 18-years old striker coming from Montenegro. My dream is to play at Olimpico alongside Francesco Totti one day. I really train hard for that. In the free time I like coding in Ruby. :)",
  nationality: "Montenegro",
  city: "Podgorica",
  age: "18"
)
user.avatar.attach(io: file, filename: 'ivo.jpg', content_type: 'image/jpg')
user.save!

file = URI.open('https://res.cloudinary.com/dzc11fywj/image/upload/v1631214233/t%C3%A9l%C3%A9chargement_qcsrcw.jpg')
user = User.new(
  email: 'jorge@mail.com', 
  password: '123456', 
  first_name:"Jorge", 
  last_name:"Mendes",
  role: "Scout",
  sport: "Football",
  position: quote.sample,
  nationality: "Portugal",
  city: "Lisbon",
  age: "55"
)
user.avatar.attach(io: file, filename: 'jorge.jpg', content_type: 'image/jpg')
user.save!


50.times do
    file = URI.open('https://res.cloudinary.com/dzc11fywj/image/upload/v1631214233/t%C3%A9l%C3%A9chargement_qcsrcw.jpg')
  user = User.new(
    email: Faker::Internet.email, 
    password: '123456', 
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    role: "Athlete",
    sport: "Football",
    position: Faker::Sports::Football.position,
    gender: ['Male', 'Female'].sample,
    footedness: ['Right', 'Left'].sample,
    weight: rand(45..120),
    height: rand(120..200),
    description: quote.sample,
    nationality: Faker::Nation.nationality,
    city: Faker::Nation.capital_city,
    age: rand(14..30)
  )
  user.avatar.attach(io: file, filename: 'ivo.jpg', content_type: 'image/jpg')
  user.save!
end

User.all.each do |user|
  pictures.sample(3).each do |picture|
    file = URI.open(picture)
    user.photos.attach(io: file, filename: "photo #{pictures[10..13]}", content_type: 'image/jpg')
    user.save!
  end
end


connection = FollowerRelationship.new(user: User.first, followed_user: User.last)
chatroom = Chatroom.create
connection.chatroom = chatroom
connection.save

puts 'Finished!'
