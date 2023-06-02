# db/seeds.rb
require "open-uri"

puts "Cleaning database..."

puts "Deleting all bookings"
Booking.destroy_all

puts "Deleting all fighters"
Fighter.destroy_all

puts "Deleting Users"
User.destroy_all

puts "Seeding..."

puts "Creating users..."
User.create(
  email: "florian@wasteless.es",
  password: "123456",
  password_confirmation: "123456",
  first_name: "Florian",
  last_name: "Wasteless",
  latitude: 40.416729,
  longitude: -3.703339,
  credit: 1000,
  address: "Barcelona"
)

User.create(
  email: "martin@wasteless.es",
  password: "123456",
  password_confirmation: "123456",
  first_name: "Martin",
  last_name: "Wasteless",
  latitude: 41.390205,
  longitude: 2.154007,
  credit: 1000,
  address: "Madrid"
)

puts "Created #{User.count} users"
puts "Creating fighters..."

zelda = Fighter.new(
  name: "Princess Zelda",
  description: "Princess of Hyrule, her magic powers can banish the evil from the surface.",
  price: 747,
  rating: "Legendary",
  max_stat: 99,
  strength: 77,
  defense: 80,
  speed: 92,
  user: User.all.sample
)

file = URI.open("https://static.wikia.nocookie.net/hunger_games_simulator/images/b/b1/Zeldatwilightprincess.png/revision/latest?cb=20210216063041")
zelda.photo.attach(io: file, filename: "zelda.jpg", content_type: "image/jpg")
zelda.save!
puts "Created Zelda"

mario = Fighter.new(
  name: "Mario",
  description: "High jumper and Gumba Smasher",
  price: 537,
  rating: "Epic",
  max_stat: 70,
  strength: 56,
  defense: 63,
  speed: 60,
  user: User.all.sample
)

file = URI.open("https://freepngimg.com/thumb/mario_bros/92454-mario-square-super-angle-bros-download-hq-png.png")
mario.photo.attach(io: file, filename: "mario.jpg", content_type: "image/jpg")
mario.save!
puts "Created Mario"

frodo = Fighter.new(
  name: "Frodo Baggins",
  description: "Ringbearer and Hero - also: Small feet",
  price: 636,
  rating: "Legendary",
  max_stat: 85,
  strength: 77,
  defense: 80,
  speed: 85,
  user: User.all.sample
)

file = URI.open("https://i.vimeocdn.com/portrait/18173250_640x640")
frodo.photo.attach(io: file, filename: "frodo.jpg", content_type: "image/jpg")
frodo.save!
puts "Created Frodo"

pato = Fighter.new(
  name: "Zenmaster Pato",
  description: "The best batch manager. Is a duck, so can't fly or fight well",
  price: 126,
  rating: "Standard",
  max_stat: 23,
  strength: 20,
  defense: 12,
  speed: 10,
  user: User.all.sample
)

file = URI.open("https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/8af7fbe5-2f76-4aa6-9982-1be6f88160fe/d4uoa2k-d75058da-72cb-446c-af38-dd0de4d8f7a8.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwic3ViIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsImF1ZCI6WyJ1cm46c2VydmljZTpmaWxlLmRvd25sb2FkIl0sIm9iaiI6W1t7InBhdGgiOiIvZi84YWY3ZmJlNS0yZjc2LTRhYTYtOTk4Mi0xYmU2Zjg4MTYwZmUvZDR1b2Eyay1kNzUwNThkYS03MmNiLTQ0NmMtYWYzOC1kZDBkZTRkOGY3YTgucG5nIn1dXX0.OepXJQwrga7X6zBP6nKtbzR0ZUGxoy7L7MOhESubo0M")
pato.photo.attach(io: file, filename: "pato.jpg", content_type: "image/jpg")
pato.save!
puts "Created Pato"

simon = Fighter.new(
  name: "Simon - The Omnipotent",
  description: "Creator and Destroyer of the Universe",
  price: 891,
  rating: "Legendary",
  max_stat: 99,
  strength: 99,
  defense: 99,
  speed: 99,
  user: User.all.sample
)

simon.save!
puts "Created Simon"

pablo = Fighter.new(
  name: "Pablo - El conquistador",
  description: "The ruler of the world",
  price: 891,
  rating: "Legendary",
  max_stat: 99,
  strength: 99,
  defense: 99,
  speed: 99,
  user: User.all.sample
)

file = URI.open("https://cdn-icons-png.flaticon.com/512/1674/1674432.png")
pablo.photo.attach(io: file, filename: "pablo.jpg", content_type: "image/jpg")
pablo.save!
puts "Created Pablo"

pikachu = Fighter.new(
  name: "Pikachu",
  description: "The most adorable pokemon, he can electroCUTE you",
  price: 510,
  rating: "Epic",
  max_stat: 60,
  strength: 60,
  defense: 50,
  speed: 60,
  user: User.all.sample
)

file = URI.open("https://pokemon-project.com/pokedex/img/sprite/Home/256/25-female.png")
pikachu.photo.attach(io: file, filename: "pikachu.jpg", content_type: "image/jpg")
pikachu.save!
puts "Created Pikachu"

homer = Fighter.new(
  name: "Homer Simpson",
  description: "Just the average american neighbour",
  price: 159,
  rating: "Standard",
  max_stat: 23,
  strength: 20,
  defense: 23,
  speed: 10,
  user: User.all.sample
)

file = URI.open("https://aux.iconspalace.com/uploads/13270996061937856141.png")
homer.photo.attach(io: file, filename: "homer.jpg", content_type: "image/jpg")
homer.save!
puts "Created Homer"

god = Fighter.new(
  name: "Almighty God",
  description: "You must believe in him in order to gain power",
  price: 9,
  rating: "Standard",
  max_stat: 1,
  strength: 1,
  defense: 1,
  speed: 1,
  user: User.all.sample
)

file = URI.open("https://i.pinimg.com/736x/94/4a/e8/944ae807a79e0ad01a70ae9485370395.jpg")
god.photo.attach(io: file, filename: "god.jpg", content_type: "image/jpg")
god.save!
puts "Created God"

supernova = Fighter.new(
  name: "Supernova",
  description: "The ultimate menace, a galaxy eater",
  price: 759,
  rating: "Legendary",
  max_stat: 90,
  strength: 90,
  defense: 78,
  speed: 85,
  user: User.all.sample
)

file = URI.open("https://c-cl.cdn.smule.com/rs-s28/arr/25/7a/96e9c773-d021-4fc7-a1e1-c57f270fe1f0.jpg")
supernova.photo.attach(io: file, filename: "supernova.jpg", content_type: "image/jpg")
supernova.save!
puts "Created Supernova"

goku = Fighter.new(
  name: "Goku",
  description: "Child version, the hero everybody needs",
  price: 342,
  rating: "Premium",
  max_stat: 45,
  strength: 40,
  defense: 30,
  speed: 44,
  user: User.all.sample
)

file = URI.open("https://cdn131.picsart.com/302747009214201.jpg?type=webp&to=crop&r=256")
goku.photo.attach(io: file, filename: "goku.jpg", content_type: "image/jpg")
goku.save!
puts "Created Goku"

wagon = Fighter.new(
  name: "Le Wagon",
  description: "The ultimate bootcamp",
  price: 342,
  rating: "Premium",
  max_stat: 45,
  strength: 40,
  defense: 30,
  speed: 44,
  user: User.all.sample
)

file = URI.open("https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/lja06nqofw4jxofpkwea")
wagon.photo.attach(io: file, filename: "wagon.jpg", content_type: "image/jpg")
wagon.save!
puts "Created Le Wagon"

puts "Created #{Fighter.count} fighters"
puts "Done seeding"


# TODO : Add Goku
