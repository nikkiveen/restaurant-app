namespace :restaurants do
  task :fetch => :environment do
    client = Yelp::Client.new({ consumer_key: ENV['YELP_CONSUMER_KEY'],
                                consumer_secret: ENV['YELP_CONSUMER_SECRET'],
                                token: ENV['YELP_TOKEN'],
                                token_secret: ENV['YELP_TOKEN_SECRET']
                              })
    parameters = { category_filter: "restaurants", limit: 20 }
    results = client.search('Austin', parameters)
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
        phone: restaurant.display_phone,
        restaurant_admin_id: rand(1..50),
        total_seats: 100,
        max_reservation_size: 6,
        seats_per_timeslot: 10,
        open_timeslot: 21,
        close_timeslot: 39,
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
              sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
              Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
              nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
              reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla 
              pariatur. Excepteur sint occaecat cupidatat non proident, sunt in 
              culpa qui officia deserunt mollit anim id est laborum.",
        email: "restaurant@restaurant.com"
      )
    end
  end
end