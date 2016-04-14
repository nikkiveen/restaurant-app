# 5.times do 
#   Restaurant.create(
#     :name => Faker::App.name,
#     :address => "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state_abbr}, #{Faker::Address.zip}",
#     :email => Faker::Internet.email,
#     :phone => Faker::PhoneNumber.phone_number,
#     :bio => Faker::Lorem.paragraph(4),
#     :restaurant_admin_id => rand(1..3)
#   )
# end


# Timeslot.create(
#   time: "7:00", 
#   restaurant_id: 1, 
#   seat_count: 5
# )

# Timeslot.create(
#   time: "7:00", 
#   restaurant_id: 2, 
#   seat_count: 5
# )

# Timeslot.create(
#   time: "7:00", 
#   restaurant_id: 3, 
#   seat_count: 5
# )

# Timeslot.create(
#   time: "7:00", 
#   restaurant_id: 4, 
#   seat_count: 5
# )

# Timeslot.create(
#   time: "7:00", 
#   restaurant_id: 5, 
#   seat_count: 5
# )

# Timeslot.create(
#   time: "8:00", 
#   restaurant_id: 1, 
#   seat_count: 5
# )

# Timeslot.create(
#   time: "8:00", 
#   restaurant_id: 2, 
#   seat_count: 5
# )

# Timeslot.create(
#   time: "8:00", 
#   restaurant_id: 3, 
#   seat_count: 5
# )

# Timeslot.create(
#   time: "8:00", 
#   restaurant_id: 4, 
#   seat_count: 5
# )

# Timeslot.create(
#   time: "8:00", 
#   restaurant_id: 5, 
#   seat_count: 5
# )

# Timeslot.create(
#   time: "9:00", 
#   restaurant_id: 1, 
#   seat_count: 5
# )

# Timeslot.create(
#   time: "9:00", 
#   restaurant_id: 2, 
#   seat_count: 5
# )

# Timeslot.create(
#   time: "9:00", 
#   restaurant_id: 3, 
#   seat_count: 5
# )

# Timeslot.create(
#   time: "9:00", 
#   restaurant_id: 4, 
#   seat_count: 5
# )

# Timeslot.create(
#   time: "9:00", 
#   restaurant_id: 5, 
#   seat_count: 5
# )
# Timeslot.create(
#   time: "10:00", 
#   restaurant_id: 1, 
#   seat_count: 5
# )

# Timeslot.create(
#   time: "10:00", 
#   restaurant_id: 2, 
#   seat_count: 5
# )

# Timeslot.create(
#   time: "10:00", 
#   restaurant_id: 3, 
#   seat_count: 5
# )

# Timeslot.create(
#   time: "10:00", 
#   restaurant_id: 4, 
#   seat_count: 5
# )

# Timeslot.create(
#   time: "10:00", 
#   restaurant_id: 5, 
#   seat_count: 5
# )

5.times do
  Seat.create(
    status: "Available",
    restaurant_id: 1,
    timeslot_id: 1, 
    date: Date.today + 1
  ) 

  Seat.create(
    status: "Available",
    restaurant_id: 1,
    timeslot_id: 2, 
    date: Date.today + 1
  ) 

  Seat.create(
    status: "Available",
    restaurant_id: 1,
    timeslot_id: 3, 
    date: Date.today + 1
  )  

  Seat.create(
    status: "Available",
    restaurant_id: 1,
    timeslot_id: 4, 
    date: Date.today + 1
  )  

  Seat.create(
    status: "Available",
    restaurant_id: 1,
    timeslot_id: 5, 
    date: Date.today + 1
  )

  Seat.create(
    status: "Available",
    restaurant_id: 1,
    timeslot_id: 1, 
    date: Date.today + 2
  ) 

  Seat.create(
    status: "Available",
    restaurant_id: 1,
    timeslot_id: 2, 
    date: Date.today + 2
  ) 

  Seat.create(
    status: "Available",
    restaurant_id: 1,
    timeslot_id: 3, 
    date: Date.today + 2
  )  

  Seat.create(
    status: "Available",
    restaurant_id: 1,
    timeslot_id: 4, 
    date: Date.today + 2
  )  

  Seat.create(
    status: "Available",
    restaurant_id: 1,
    timeslot_id: 5, 
    date: Date.today + 2
  )
  Seat.create(
    status: "Available",
    restaurant_id: 1,
    timeslot_id: 1, 
    date: Date.today + 3
  ) 

  Seat.create(
    status: "Available",
    restaurant_id: 1,
    timeslot_id: 2, 
    date: Date.today + 3
  ) 

  Seat.create(
    status: "Available",
    restaurant_id: 1,
    timeslot_id: 3, 
    date: Date.today + 3
  )  

  Seat.create(
    status: "Available",
    restaurant_id: 1,
    timeslot_id: 4, 
    date: Date.today + 3
  )  

  Seat.create(
    status: "Available",
    restaurant_id: 1,
    timeslot_id: 5, 
    date: Date.today + 3
  )
  Seat.create(
    status: "Available",
    restaurant_id: 1,
    timeslot_id: 1, 
    date: Date.today + 4
  ) 

  Seat.create(
    status: "Available",
    restaurant_id: 1,
    timeslot_id: 2, 
    date: Date.today + 4
  ) 

  Seat.create(
    status: "Available",
    restaurant_id: 1,
    timeslot_id: 3, 
    date: Date.today + 4
  )  

  Seat.create(
    status: "Available",
    restaurant_id: 1,
    timeslot_id: 4, 
    date: Date.today + 4
  )  

  Seat.create(
    status: "Available",
    restaurant_id: 1,
    timeslot_id: 5, 
    date: Date.today + 4
  )
end