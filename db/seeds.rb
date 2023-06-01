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
  credit: 1000
  address: "Madrid"
)

puts "Created #{User.count} users"
puts "Creating fighters..."

zelda = Fighter.new(
  name: "Zelda",
  description: "Princess of Hyrule, her magic powers can banish the evil from the surface.",
  price: 50,
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
  price: 20,
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
  price: 40,
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
  name: "Pato The Duck",
  description: "The best batch manager. Is a duck, so can't fly or fight well",
  price: 34,
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
  name: "Simon, Destroyer of the Universe",
  description: "Creator and Destroyer of the Universe",
  price: 80,
  rating: "Legendary",
  max_stat: 99,
  strength: 99,
  defense: 99,
  speed: 99,
  user: User.all.sample
)

simon.save!
puts "Created Simon"

puts "Created #{Fighter.count} fighters"
puts "Done seeding"


# TODO : Add Goku
