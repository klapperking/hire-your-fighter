# db/seeds.rb
require "open-uri"

puts "Cleaning database..."
Fighter.destroy_all
User.destroy_all

puts "creating user..."
user = { email: "123@123.com", password: "123456", password_confirmation: "123456", first_name: "Pablo", last_name: "Mallorqui", credit: 1000 }
user_saved = User.create!(user)
puts "Finished!"

puts "Creating fighters..."
zelda = { name: "Zelda", description: "Princess of Hyrule, her magic powers can banish the evil from the surface.", price: 50, rating: "Legendary", strength: 60, defense: 39 }
goblin = { name: "Goblin", description: "Just a random foe", price: 5, rating: "standard", strength: 10, defense: 8 }
goblin2 =  { name: "Goblin 2", description: "Just a random foe", price: 5, rating: "standard", strength: 10, defense: 8 }
goblin3 =  { name: "Goblin 3", description: "Just a random foe", price: 5, rating: "standard", strength: 10, defense: 8 }
goblin4 =  { name: "Goblin 4", description: "Just a random foe", price: 5, rating: "standard", strength: 10, defense: 8 }
goblin5 =  { name: "Goblin 5", description: "Just a random foe", price: 5, rating: "standard", strength: 10, defense: 8 }
goblin6 =  { name: "Goblin 6", description: "Just a random foe", price: 5, rating: "standard", strength: 10, defense: 8 }
goblin7 =  { name: "Goblin 7", description: "Just a random foe", price: 5, rating: "standard", strength: 10, defense: 8 }
goblin8 =  { name: "Goblin 8", description: "Just a random foe", price: 5, rating: "standard", strength: 10, defense: 8 }
goblin9 =  { name: "Goblin 9", description: "Just a random foe", price: 5, rating: "standard", strength: 10, defense: 8 }

[zelda, goblin, goblin2, goblin3, goblin4, goblin5, goblin6, goblin7, goblin8, goblin9].each do |attributes|
  fighter = Fighter.new(attributes)
  fighter.user = user_saved
  fighter.save!
  puts "Created #{fighter.name}"
end

fighter_zelda = Fighter.first
file = URI.open("https://static.wikia.nocookie.net/hunger_games_simulator/images/b/b1/Zeldatwilightprincess.png/revision/latest?cb=20210216063041")
fighter_zelda.photo.attach(io: file, filename: "zelda.jpg", content_type: "image/jpg")
fighter_zelda.save!
