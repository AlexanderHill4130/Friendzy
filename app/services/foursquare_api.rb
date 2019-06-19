
#Api keys
OPENCAGE_api_key = '326fd91273a0466ab76977cd624ae3fc'
FOURSQUARE_client_id = 'OXJ3CS51V01RFUVKKAZS4THD0G5TW5JIELAPKQ4WSHTWYEZK'
FOURSQUARE_client_secret = 'Z0YXZBCZDCTOV4JKTEGGQLCNTCP4JNBP5UT14WMUCSVINDTC'

#Initializer
geocoder = OpenCage::Geocoder.new(api_key: OPENCAGE_api_key )
client = Foursquare2::Client.new(client_id: FOURSQUARE_client_id,
                                 client_secret: FOURSQUARE_client_secret,
                                 api_version:'20190609')


#Input
location = "Milan"
query = "Party"


#Main
results = geocoder.geocode(location)
lat = results.first.coordinates[0]
lng = results.first.coordinates[1]
RES = client.search_venues(ll: "#{lat},#{lng}", query: query)


#Results
# Pry::ColorPrinter.pp(res)
