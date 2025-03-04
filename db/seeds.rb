# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

puts "cleaning database..."

Instrument.destroy_all
User.destroy_all
Category.destroy_all

brands =  ["Yamaha", "Fender", "Gibson", "Roland", "Korg", "Casio", "Nord", "Ibanez", "Taylor", "Martin",    "Kawai", "Pearl", "Zildjian", "DW Drums", "Sonor", "Gretsch", "Epiphone", "Schecter", "ESP", "Jackson"]
models = [ "Yamaha FG800", "Fender Stratocaster", "Ibanez SR", "Roland Digital Keyboard", "Pearl Drum Set", "Stradivarius-Inspired Violin", "Yamaha Alto Saxophone", "Bach Stradivarius Trumpet", "Handcrafted Cello", "Buffet Crampon Clarinet", "Aegean Mandolin", "Deering Banjo", "Casio Electric Piano", "Korg Synthesizer", "Complete Percussion Set", "Pearl Flute", "Hohner Diatonic Harmonica", "Well-Tuned Viola", "Sturdy Double Bass", "Pioneer DJ Controller" ]
titles = [ "Yamaha FG800 Acoustic Guitar Rental", "Fender Stratocaster Electric Guitar Rental", "Ibanez SR Bass Guitar Rental", "Roland Digital Keyboard Rental", "Pearl Drum Set Rental", "Stradivarius-Inspired Violin Rental", "Yamaha Alto Saxophone Rental", "Bach Stradivarius Trumpet Rental", "Handcrafted Cello Rental", "Buffet Crampon Clarinet Rental", "Aegean Mandolin Rental", "Deering Banjo Rental", "Casio Electric Piano Rental", "Korg Synthesizer Rental", "Complete Percussion Set Rental", "Pearl Flute Rental", "Hohner Diatonic Harmonica Rental", "Well-Tuned Viola Rental", "Sturdy Double Bass Rental", "Pioneer DJ Controller Rental" ]

puts "creating users"
User.create!(email: "toto@sfr.fr", password: "password")
User.create!(email: "tito@sfr.en", password: "password")


puts "creating categories"
Category.create!(title: "Guitar", icon: "🎸")
Category.create!(title: "drums", icon: "🥁")
Category.create!(title: "Keyboard", icon: "🎹")


puts 'creating loops'
 50.times do
  Instrument.create!(
    brand: brands.sample,
    description: Faker::Lorem.sentence(word_count: 10),
    model: models.sample,
    price_per_day: Faker::Number.decimal(l_digits: 2),
    title: titles.sample,
    user: User.all.sample,
    category: Category.all.sample
  )
end
