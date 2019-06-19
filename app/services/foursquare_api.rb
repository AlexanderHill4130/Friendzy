
#Api keys
OPENCAGE_api_key = ENV['OPENCAGE_KEY']
FOURSQUARE_client_id = ENV['FOURSQUARE_ID']
FOURSQUARE_client_secret = ENV['FOURSQUARE_SECRET']

# #Initializer
# geocoder = OpenCage::Geocoder.new(api_key: OPENCAGE_api_key )
# client = Foursquare2::Client.new(client_id: FOURSQUARE_client_id,
#                                  client_secret: FOURSQUARE_client_secret,
#                                  api_version:'20190609')


# #Input
# location = "Milan"
# query = "Party"


# #Main
# results = geocoder.geocode(location)
# lat = results.first.coordinates[0]
# lng = results.first.coordinates[1]
# RES = client.search_venues(ll: "#{lat},#{lng}", query: query)


#Results
# Pry::ColorPrinter.pp(res)

def search_api(location, query)

  #Initializer
  geocoder = OpenCage::Geocoder.new(api_key: OPENCAGE_api_key )
  client = Foursquare2::Client.new(client_id: FOURSQUARE_client_id,
                                   client_secret: FOURSQUARE_client_secret,
                                   api_version:'20190609')

  #Main
  results = geocoder.geocode(location)
  lat = results.first.coordinates[0]
  lng = results.first.coordinates[1]
  res = client.search_venues(ll: "#{lat},#{lng}", query: query)

  res.first.last.each_with_index do |r, i|
    break if i > 19
    categories = r.categories.first
    place = Place.new(
        name: r.name,
        category: categories ? categories.shortName : 'Undefined',
        address:  if r.location.address.present?
                    "#{r.location.address}, #{r.location.country}"
                  else
                    r.location.country
                  end,
        rating: rand(1..5)

    )
    place.save!
  end
end
