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
Place.destroy_all
Interest.destroy_all
User.destroy_all


puts 'Creating 20 fake users...'
  u1 = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "user@example.com",
    password: "123456")

    u1.remote_photo_url = "http://www.columbiaphotography.co.uk/wp-content/uploads/2018/04/dating-photography-photo.jpg"
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
20.times do
  av = Availability.new(
    since_date: Faker::Date.forward(2),
    until_date: Faker::Date.forward(5),
    user: User.all.sample
  )
  av.save!
end
puts 'Finished!'

puts 'Creating 20 fake interests...'
categories = %w[Movies Music Food Cooking Aquarium Library Bar Cafe Museum Casino Shopping Hospital]
20.times do
  interest = Interest.new(
    name:    categories.sample
  )
  interest.save!
end
puts 'Finished!'

puts 'Creating 20 real places in Milan...'
search_api("Milan", "party")
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
puts 'Finished!'

puts 'Creating 20 fake place_categories...'
20.times do
  pcat = PlaceCategory.new(
    place: Place.all.sample,
    interest: Interest.all.sample,
  )
  pcat.save!
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
