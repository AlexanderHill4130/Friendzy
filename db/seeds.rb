require 'faker'
require_relative '../app/services/foursquare_api.rb'
require 'httparty'
require 'json'

# puts RES
def randomuser_api
  api = "https://randomuser.me/api/"
   response = HTTParty.get(api)
   response["results"].first["picture"]["large"]
end



puts 'Cleaning Dabatase...'
UserInterest.destroy_all
Availability.destroy_all
Friendship.destroy_all
PlaceCategory.destroy_all
ChatroomUser.destroy_all
Chatroom.destroy_all
Place.destroy_all
Interest.destroy_all
User.destroy_all


puts 'Creating 20 fake users...'
  u1 = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "user@example.com",
    password: "123456")

    u1.remote_photo_url = randomuser_api
    u1.save!

  20.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"
  )
  user.remote_photo_url = randomuser_api
  user.save!
end

puts 'Finished!'

puts 'Creating 20 fake availabilities...'

Availability.new(
  since_date: Faker::Date.forward(2),
  until_date: Faker::Date.forward(5),
  user: u1
).save!

20.times do
  av = Availability.new(
    since_date: Faker::Date.forward(2),
    until_date: Faker::Date.forward(5),
    user: User.all.sample
  )
  av.save!
end
puts 'Finished!'

categories = %w[Movies Music Food Cooking Aquarium Library Bar Cafe Museum Casino Shopping Hospital]
puts "Creating #{categories.count} fake interests..."
categories.each do |category|
  interest = Interest.new(
    name:    category
  )
  interest.save!
end
puts 'Finished!'

#puts 'Creating 20 real places in Milan...'
#search_api("Milan", "bar")
      # raw_res.each_with_index do |r, i|
      #   break if i > 19
      #   categories = r.categories.first
      #   place = Place.new(
      #       name: r.name,
      #       category: categories ? categories.shortName : 'Undefined',
      #       address:  if r.location.address.present?
      #                   "#{r.location.address}, #{r.location.country}"
      #                 else
      #                   r.location.country
      #                 end,
      #       rating: rand(1..5)

      #   )
      #   place.save!
      # end
#puts 'Finished!'
puts "Creating place 1"
place1 = Place.new(
        name: "Cioccolatitaliani",
        category: "Coffee",
        address:  "Piazzale Luigi Cadorna, 10",
        rating: rand(1..5),
        description: "Founded in 2009 by the Ferrieri family. The best chocolate in the world with ice cream, pastry, coffee shop and kitchen.",
        # description: Faker::Lorem.paragraphs

    )
place1.remote_photo_url = "https://images.unsplash.com/photo-1521017432531-fbd92d768814?ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"
place1.save!

puts "Creating place 2"
place2 = Place.new(
        name: "Cantina Carducci",
        category: "Wine Bar",
        address:  "Via Giosuè Carducci, 9",
        rating: rand(1..5),
        description: "Wine bar in the historic center. A place to relax sipping good wine or a cocktail paired with refined snacks.",

    )
place2.remote_photo_url = "https://images.unsplash.com/photo-1550082495-5748ac6655c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"
place2.save!

puts "Creating place 3"
place3 = Place.new(
        name: "Le Wagon Demo Day - Batch 263",
        category: "Coding",
        address:  "Via Massimo D'Azeglio, 3",
        rating: rand(1..5),
        description: "Friday, June 28th, at 7:00 pm, at Milan LUISS Hub for makers and students, our students will show the result of their journey with Le Wagon.",

    )
place3.remote_photo_url = "https://s3-us-west-2.amazonaws.com/s.cdpn.io/2/lewagon-2.jpg"
place3.save!

puts "Creating place 4"
place4 = Place.new(
        name: "Cecco Ristorante Pizzeria",
        category: "Restaurant",
        address:  "Via Vincenzo Monti, 34",
        rating: rand(1..5),
        description: "The Cecco Restaurant Pizzeria stands out for the quality of its cuisine, gaining the esteem and trust of a vast Milanese clientele and more.",

    )
place4.remote_photo_url = "https://www.dacecco.com/wp-content/uploads/2019/03/DaCecco3.jpg"
place4.save!

puts "Creating place 5"
place5 = Place.new(
        name: "The Space Cinema",
        category: "Cinema",
        address:  "Via Santa Radegonda, 8",
        rating: rand(1..5),
        description: "Cinema offering 10-12 theatres including an IMAX . Served by a huge parking and has bars to take drinks, snacks, ice creams and pop corns.",

    )
place5.remote_photo_url = "https://zero-media.s3.amazonaws.com/uploads/2015/05/The-Space-Cinema-Odeon-Cinema-Cultura-Milano-Film.jpg"
place5.save!

puts 'Creating 20 fake place_categories...'
20.times do
  pcat = PlaceCategory.new(
    place: Place.all.sample,
    interest: Interest.all.sample,
  )
end
puts 'Finished!'

puts 'Creating 20 fake friendships...'
20.times do
  friendship = Friendship.new(
    user: User.all.sample,
    friend:  User.all.sample,
  )
  friendship.save!
end
puts 'Finished!'

puts 'Creating 20 fake user_interests...'
20.times do
  uint = UserInterest.new(
    user: User.all.sample,
    interest: Interest.all.sample,
  )
  uint.save!
end
puts 'Finished!'





