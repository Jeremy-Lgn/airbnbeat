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

# users = ["user1", "user2", "user3", "user4", "user5", "user6", "user7", "user8", "user9", "user10"]
# categories = ["Guitar", "Bass", "Keyboard", "Drums", "Violin", "Saxophone", "Trumpet", "Cello", "Clarinet", "Mandolin", "Banjo", "Piano", "Synthesizer", "Percussion", "Flute", "Harmonica", "Viola", "Double Bass", "DJ Controller"]

brands =  ["Yamaha", "Fender", "Gibson", "Roland", "Korg", "Casio", "Nord", "Ibanez", "Taylor", "Martin",    "Kawai", "Pearl", "Zildjian", "DW Drums", "Sonor", "Gretsch", "Epiphone", "Schecter", "ESP", "Jackson"]
# descriptions = ["Yamaha FG800 acoustic guitar with a warm, rich tone for an authentic sound.", "Fender Stratocaster electric guitar that delivers a timeless rock vibe.", "Ibanez SR bass guitar perfect for groovy lines and versatile performance.", "Roland digital keyboard featuring 88 weighted keys and a rich built-in sound library.", "Pearl drum set in excellent condition, complete with cymbals and hardware.", "Stradivarius-inspired violin ideal for classical recitals and studio recordings.", "Yamaha alto saxophone known for its smooth tone and reliable performance.", "Bach Stradivarius trumpet suitable for jazz ensembles, classical pieces, and marching bands.", "Hand-crafted cello offering deep, resonant sound ideal for orchestral performances.", "Buffet Crampon clarinet with excellent intonation across various musical styles.", "Aegean mandolin delivering a bright, lively sound perfect for folk and bluegrass music.", "Deering banjo, in great condition, ideal for bluegrass and country genres.", "Casio electric piano with realistic sound sampling and versatile connectivity options.", "Korg synthesizer featuring an extensive range of sounds for electronic music production.", "Complete percussion set including congas, bongos, and shakers for dynamic performances.", "Pearl flute with a clear, melodious tone perfect for solos and ensemble settings.", "Hohner diatonic harmonica, a great choice for blues, folk, and country tunes.", "Well-tuned viola offering a balanced tone for symphony orchestras and chamber music.", "Sturdy double bass suited for both jazz improvisations and classical performances.", "Pioneer DJ controller equipped with advanced mixing features for live shows."]
models = [ "Yamaha FG800", "Fender Stratocaster", "Ibanez SR", "Roland Digital Keyboard", "Pearl Drum Set", "Stradivarius-Inspired Violin", "Yamaha Alto Saxophone", "Bach Stradivarius Trumpet", "Handcrafted Cello", "Buffet Crampon Clarinet", "Aegean Mandolin", "Deering Banjo", "Casio Electric Piano", "Korg Synthesizer", "Complete Percussion Set", "Pearl Flute", "Hohner Diatonic Harmonica", "Well-Tuned Viola", "Sturdy Double Bass", "Pioneer DJ Controller" ]
# price_per_days = [ 50, 60, 70.5, 55, 65, 75.1, 80, 50, 60, 70, 45.9, 55, 65, 75, 85, 90.5, 95, 100, 110, 120.7 ]
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
