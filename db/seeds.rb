5.times do 
  Restaurant.create(
    :name => Faker::App.name,
    :address => "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state_abbr}, #{Faker::Address.zip}",
    :email => Faker::Internet.email,
    :phone => Faker::PhoneNumber.phone_number,
    :bio => Faker::Lorem.paragraph(4),
    :restaurant_admin_id => rand(1..3)
  )
end

5.times do
  Seat.create(
    status: "Available",
    restaurant_id: 1
  ) 

  Seat.create(
    status: "Available",
    restaurant_id: 2
  )

  Seat.create(
    status: "Available",
    restaurant_id: 3
  ) 
  
  Seat.create(
    status: "Available",
    restaurant_id: 4
  ) 
  
  Seat.create(
    status: "Available",
    restaurant_id: 5
  ) 
end 