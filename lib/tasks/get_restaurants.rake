namespace :restaurants do
  task :fetch => :environment do
    client = Yelp::Client.new({ consumer_key: ENV['yelp_consumer_key'],
                                consumer_secret: ENV['yelp_consumer_secret'],
                                token: ENV['yelp_token'],
                                token_secret: ENV['yelp_token_secret']
                              })
    parameters = { category_filter: "restaurants", limit: 16 }
    results = client.search('Chicago', parameters)
    restaurants = results.businesses
    restaurants.each do |restaurant|
      Restaurant.create(
        name: restaurant.name,
        address: restaurant.location.address.first
      )
      break
    end
  end
end