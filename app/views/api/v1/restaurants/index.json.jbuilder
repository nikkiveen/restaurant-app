json.array! @restaurants.each do |restaurant|
  json.id restaurant.id
  json.name restaurant.name
  json.address restaurant.address
  json.phone restaurant.phone
  json.email restaurant.email
  json.bio restaurant.bio
  json.restaurantAdminId restaurant.restaurant_admin_id
  json.maxReservationSize restaurant.max_reservation_size
end