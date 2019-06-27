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
        name: "Hotel Magenta",
        category: "Hotel",
        address:  "Corso Magenta, 52",
        rating: rand(1..5),
        description: Faker::Lorem.paragraphs.join()
        # description: Faker::Lorem.paragraphs

    )
place1.remote_photo_url = "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"
place1.save!

puts "Creating place 2"
place2 = Place.new(
        name: "Caffè Napoli",
        category: "Cafe",
        address:  "Piazza Cadorna, 1",
        rating: rand(1..5),
        description: Faker::Lorem.paragraphs.join()

    )
place2.remote_photo_url = "https://images.unsplash.com/photo-1521017432531-fbd92d768814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"
place2.save!

puts "Creating place 3"
place3 = Place.new(
        name: "Piscina Swim",
        category: "Pool",
        address:  "Corso Como, 34",
        rating: rand(1..5),
        description: Faker::Lorem.paragraphs.join()

    )
place3.remote_photo_url = "https://images.unsplash.com/photo-1505847610351-22b86a1afd66?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"
place3.save!

puts "Creating place 4"
place4 = Place.new(
        name: "Spritz Aperitivo",
        category: "Bar",
        address:  "Naviglio grande, 2",
        rating: rand(1..5),
        description: Faker::Lorem.paragraphs.join()

    )
place4.remote_photo_url = "https://images.unsplash.com/photo-1470337458703-46ad1756a187?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=749&q=80"
place4.save!

puts "Creating place 5"
place5 = Place.new(
        name: "Cocktail Bar",
        category: "Bar",
        address:  "Colonne di S.Lorenzo",
        rating: rand(1..5),
        description: Faker::Lorem.paragraphs.join()

    )
place5.remote_photo_url = "https://images.unsplash.com/photo-1497644083578-611b798c60f3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"
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





