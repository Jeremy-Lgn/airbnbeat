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
User.create!(email: "toto@sfr.fr", password: "password", name: "toto", address: "22 rue des capucins 69005 Lyon")
User.create!(email: "tito@sfr.en", password: "password", name: "tata", address: "48 rue des capucines 69005 Lyon")


puts "creating categories"
Category.create!(title: "Guitar", icon: "🎸")
Category.create!(title: "drums", icon: "🥁")
Category.create!(title: "Keyboard", icon: "🎹")


puts 'creating loops'
 10.times do
  puts 'creating an Instrument'
  instrument = Instrument.new(
    brand: brands.sample,
    description: Faker::Lorem.sentence(word_count: 10),
    model: models.sample,
    price_per_day: Faker::Number.decimal(l_digits: 2),
    title: titles.sample,
    user: User.all.sample,
    category: Category.all.sample
  )

  puts 'attaching file 1'
  file = URI.parse("https://res.cloudinary.com/dm2aoqxzy/image/upload/v1741095340/inst-1.png").open
  instrument.photos.attach(io: file, filename: "inst1.png", content_type: "image/png")
  puts 'attaching file 2'
  file = URI.parse("https://res.cloudinary.com/dm2aoqxzy/image/upload/v1741095340/inst-2.png").open
  instrument.photos.attach(io: file, filename: "inst2.png", content_type: "image/png")
  puts 'attaching file 3'
  file = URI.parse("https://res.cloudinary.com/dm2aoqxzy/image/upload/v1741095340/inst-3.png").open
  instrument.photos.attach(io: file, filename: "inst3.png", content_type: "image/png")
  puts 'saving...'
  instrument.save!
end
