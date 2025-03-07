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

puts "creating users"
toto = User.create!(email: "toto@sfr.fr", password: "password", name: "Bob", address: "22 rue des capucins 69001 Lyon")
User.create!(email: "tito@sfr.en", password: "password", name: "John", address: "1 rue Burdeau 69001 Lyon")
User.create!(email: "tata@sfr.fr", password: "password", name: "Emma", address: "1 place Louis Pardel 69001 Lyon")
User.create!(email: "tutu@sfr.en", password: "password", name: "Ursul", address: "9 rue des Augustins 69001 Lyon")
User.create!(email: "titi@sfr.fr", password: "password", name: "Stephanie", address: "4 rue de la Martinière 69001 Lyon")
User.create!(email: "toti@sfr.en", password: "password", name: "Thomas", address: "15 rue Bouteille 69001 Lyon")
User.create!(email: "louis@sfr.en", password: "password", name: "Louis", address: "10 Rue de Belfort 69004 Lyon")
User.create!(email: "roger@sfr.fr", password: "password", name: "Roger", address: "8 Rue de Belfort 69004 Lyon")
User.create!(email: "pascal@sfr.en", password: "password", name: "Pascal", address: "8 Rue Ozanam 69001 Lyon")
User.create!(email: "fred@sfr.fr", password: "password", name: "Fred", address: "12 Rue Jeanne-Marie-Célu 69004 Lyon")
User.create!(email: "momo@sfr.en", password: "password", name: "Mohamed", address: "5 Rue Denfert-Rochereau 69004 Lyon")
User.create!(email: "luc@sfr.en", password: "password", name: "Luc", address: "20 Rue Général-de-Sève 69001 Lyon")
User.create!(email: "nabil@sfr.fr", password: "password", name: "Nabil", address: "25 Rue Aimé Boussange 69004 Lyon")
User.create!(email: "antoine@sfr.en", password: "password", name: "Antoine", address: "30 Rue André Bonin 69004 Lyon")
User.create!(email: "jeremy@sfr.fr", password: "password", name: "Jeremy", address: "35 Rue Artaud 69004 Lyon")
User.create!(email: "bruno@sfr.en", password: "password", name: "Bruno", address: "40 Rue Audran 69004 Lyon")
User.create!(email: "david@sfr.en", password: "password", name: "David", address: "45 Rue Barodet 69004 Lyon")
User.create!(email: "benjamin@sfr.fr", password: "password", name: "Benjamin", address: "50 Rue Bournes 69004 Lyon")
User.create!(email: "yanis@sfr.en", password: "password", name: "Yanis", address: "55 Rue de Cuire 69004 Lyon")
User.create!(email: "anthony@sfr.fr", password: "password", name: "Anthony", address: "60 Rue Deleuvre 69004 Lyon")
User.create!(email: "mathieu@sfr.en", password: "password", name: "Mathieu", address: "65 Rue Duviard 69004 Lyon")


puts "creating categories"
Category.create!(title: "Guitar", icon: "🎸")
Category.create!(title: "Drum", icon: "🥁")
Category.create!(title: "Piano", icon: "🎹")
Category.create!(title: "Ukulele", icon: "♪")
Category.create!(title: "Saxophone", icon: "🎷")
Category.create!(title: "DJ", icon: "🎛️")
Category.create!(title: "Violin", icon: "🎻")
Category.create!(title: "Flute", icon: "🪈")
Category.create!(title: "Trumpet", icon: "🎺")
Category.create!(title: "Cello", icon: "♭")

instrument_attributes = [
  {brand: "Yamaha",
  model: "FG 800",
  category: Category.find_by(title: "Guitar"),
  },
  {brand: "Fender",
  model: "Stratocaster",
  category: Category.find_by(title: "Guitar"),
  },
  {brand: "Gretsch",
  model: "Catalina Club Jazz 18",
  category: Category.find_by(title: "Drum"),
  },
  {brand: "Pearl",
  model: "Masters Maple",
  category: Category.find_by(title: "Drum"),
  },
  {brand: "Yamaha",
  model: "U1",
  category: Category.find_by(title: "Piano"),
  },
  {brand: "Steinway & Sons",
  model: "Steinway Model O",
  category: Category.find_by(title: "Piano"),
  },
  {brand: "Kala",
  model: "KA-15S",
  category: Category.find_by(title: "Ukulele"),
  },
  {brand: "Kamaka",
  model: "HF-1",
  category: Category.find_by(title: "Ukulele"),
  },
  {brand: "Selmer",
  model: "Mark VI",
  category: Category.find_by(title: "Saxophone"),
  },
  {brand: "Yamaha",
  model: "YAS-280",
  category: Category.find_by(title: "Saxophone"),
  },
  {brand: "Pioneer DJ",
  model: "CDJ-3000",
  category: Category.find_by(title: "DJ"),
  },
  {brand: "Technics",
  model: "SL-1200MK7",
  category: Category.find_by(title: "Keyboard"),
  },
  {brand: "Stradivarius",
  model: "Messiah",
  category: Category.find_by(title: "Violin"),
  },
  {brand: "Yamaha",
  model: "YVN500S",
  category: Category.find_by(title: "Violin"),
  },
  {brand: "Yamaha",
  model: "YFL-222",
  category: Category.find_by(title: "Flute"),
  },
  {brand: "Miyazawa",
  model: "PB-402",
  category: Category.find_by(title: "Flute"),
  },
  {brand: "Bach",
  model: "Stradivarius 180S37",
  category: Category.find_by(title: "Trumpet"),
  },
  {brand: "Yamaha",
  model: "YTR-2330",
  category: Category.find_by(title: "Trumpet"),
  },
  {brand: "Stradivarius",
  model: "Duport",
  category: Category.find_by(title: "Cello"),
  },
  {brand: "Stentor",
  model: "Conservatoire",
  category: Category.find_by(title: "Cello"),
  },
]

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

instrument_attributes.each do |attributes|
  puts "creating an Instrument"
  1.times do
    instrument = Instrument.new(
      brand: attributes[:brand],
      description: Faker::Lorem.sentence(word_count: 10),
      model: attributes[:model],
      price_per_day: Faker::Number.decimal(l_digits: 2),
      title: "#{attributes[:brand]} - #{attributes[:model]}",
      user: User.all.sample,
      category: attributes[:category]
      )

      rand(1..5).times do |index|
        attach_photo(instrument, index)
      end

      puts 'saving...'
      instrument.save!
    end
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
