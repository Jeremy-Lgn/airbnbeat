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
Feedback.destroy_all
Booking.destroy_all
Instrument.destroy_all
User.destroy_all
Category.destroy_all

brands =  ["Yamaha", "Fender", "Gibson", "Roland", "Korg", "Casio", "Nord", "Ibanez", "Taylor", "Martin",    "Kawai", "Pearl", "Zildjian", "DW Drums", "Sonor", "Gretsch", "Epiphone", "Schecter", "ESP", "Jackson"]
models = [ "Yamaha FG800", "Fender Stratocaster", "Ibanez SR", "Roland Digital Keyboard", "Pearl Drum Set", "Stradivarius-Inspired Violin", "Yamaha Alto Saxophone", "Bach Stradivarius Trumpet", "Handcrafted Cello", "Buffet Crampon Clarinet", "Aegean Mandolin", "Deering Banjo", "Casio Electric Piano", "Korg Synthesizer", "Complete Percussion Set", "Pearl Flute", "Hohner Diatonic Harmonica", "Well-Tuned Viola", "Sturdy Double Bass", "Pioneer DJ Controller" ]
titles = [ "Yamaha FG800 Acoustic Guitar Rental", "Fender Stratocaster Electric Guitar Rental", "Ibanez SR Bass Guitar Rental", "Roland Digital Keyboard Rental", "Pearl Drum Set Rental", "Stradivarius-Inspired Violin Rental", "Yamaha Alto Saxophone Rental", "Bach Stradivarius Trumpet Rental", "Handcrafted Cello Rental", "Buffet Crampon Clarinet Rental", "Aegean Mandolin Rental", "Deering Banjo Rental", "Casio Electric Piano Rental", "Korg Synthesizer Rental", "Complete Percussion Set Rental", "Pearl Flute Rental", "Hohner Diatonic Harmonica Rental", "Well-Tuned Viola Rental", "Sturdy Double Bass Rental", "Pioneer DJ Controller Rental" ]

puts "creating users"
toto = User.create!(email: "toto@sfr.fr", password: "password", name: "toto", address: "22 rue des capucins 69001 Lyon")
User.create!(email: "tito@sfr.en", password: "password", name: "tata", address: "1 rue Burdeau 69001 Lyon")
User.create!(email: "tata@sfr.fr", password: "password", name: "toto", address: "1 place Louis Pardel 69001 Lyon")
User.create!(email: "tutu@sfr.en", password: "password", name: "tata", address: "9 rue des Augustins 69001 Lyon")
User.create!(email: "titi@sfr.fr", password: "password", name: "toto", address: "4 rue de la Martinière 69001 Lyon")
User.create!(email: "toti@sfr.en", password: "password", name: "tata", address: "15 rue Bouteille 69001 Lyon")

puts "creating categories"
Category.create!(title: "Guitar", icon: "🎸")
Category.create!(title: "Drumming", icon: "🥁")
Category.create!(title: "Piano", icon: "🎹")
Category.create!(title: "Ukulele", icon: "♪")
Category.create!(title: "Saxophone", icon: "🎷")
Category.create!(title: "Keyboard", icon: "🎛️")
Category.create!(title: "Violin", icon: "🎻")
Category.create!(title: "Flute", icon: "🪈")
Category.create!(title: "Trumpet", icon: "🎺")
Category.create!(title: "Cello", icon: "♭")


puts 'creating instruments'
def get_photo(instrument)
  puts "getting photo"
  search_param = instrument.category.title.downcase
  search_param = "piano" if instrument.category.title.downcase == "keyboard"
  photo_url = Unsplash::Photo.search(search_param).sample.urls.full
   URI.parse(photo_url).open
end

def attach_photo(instrument, index=0)
  puts "attaching photo"
  instrument.photos.attach(io: get_photo(instrument), filename: "#{instrument.title}#{index+1}.png", content_type: "image/png")
end

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

  3.times do |index|
    attach_photo(instrument, index)
  end

  puts 'saving...'
  instrument.save!
end

puts 'creating bookings'
Booking.create!(start_date: Date.new(2025,2,3), end_date: Date.new(2025,2,6), user: User.all.sample, instrument: Instrument.all.sample)
Booking.create!(start_date: Date.new(2025,4,6), end_date: Date.new(2025,5,8), user: User.all.sample, instrument: Instrument.all.sample)
Booking.create!(start_date: Date.new(2025,2,3), end_date: Date.new(2025,2,6), user: User.all.sample, instrument: Instrument.all.sample)
Booking.create!(start_date: Date.new(2025,4,6), end_date: Date.new(2025,5,8), user: User.all.sample, instrument: Instrument.all.sample)
Booking.create!(start_date: Date.new(2025,6,10), end_date: Date.new(2025,6,15), user: User.all.sample, instrument: Instrument.all.sample)




puts 'Creating feedbacks...'
bookings = Booking.all
bookings.each do |booking|
  1.times do
    Feedback.create!(
      comment: Faker::Lorem.paragraph(sentence_count: 3),
      rating: rand(1..5),
      booking: booking
    )
  end
end

puts 'done'
