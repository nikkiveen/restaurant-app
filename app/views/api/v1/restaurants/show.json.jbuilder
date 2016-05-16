  json.id @restaurant.id
  json.name @restaurant.name
  json.address @restaurant.address
  json.city @restaurant.city
  json.state @restaurant.state
  json.zip @restaurant.zip
  json.latitude @restaurant.latitude
  json.longitude @restaurant.longitude
  json.phone @restaurant.phone
  json.email @restaurant.email
  json.bio @restaurant.bio
  json.restaurantAdminId @restaurant.restaurant_admin_id
  json.maxReservationSize @restaurant.max_reservation_size
  json.totalSeats @restaurant.total_seats
  json.seatsPerTimeslot @restaurant.seats_per_timeslot
  json.openTimeslot @restaurant.open_timeslot
  json.closeTimeslot @restaurant.close_timeslot
  json.reservations @restaurant.reservations.each do |reservation|
    json.id reservation.id
    json.timeslotId reservation.timeslot_id
    json.datetime reservation.datetime
    json.headCount reservation.head_count
    json.dinerId reservation.diner_id
    json.dinerName reservation.diner_name
    json.dinerPhone reservation.diner_phone
  end
