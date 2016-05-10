namespace :restaurants do
  task :fetch => :environment do
    client = Yelp::Client.new({ consumer_key: ENV['YELP_CONSUMER_KEY'],
                                consumer_secret: ENV['YELP_CONSUMER_SECRET'],
                                token: ENV['YELP_TOKEN'],
                                token_secret: ENV['YELP_TOKEN_SECRET']
                              })
    parameters = { category_filter: "restaurants", limit: 20 }
    results = client.search('Chicago', parameters)
    restaurants = results.businesses
    restaurants.each do |restaurant|
      Restaurant.create(
        name: restaurant.name,
        address: restaurant.location.address.first, 
        city: restaurant.location.city,
        state: restaurant.location.state_code,
        zip: restaurant.location.postal_code,
        latitude: restaurant.location.coordinate.latitude,
        longitude: restaurant.location.coordinate.longitude,
        phone: restaurant.display_phone
      )
    end
  end
end