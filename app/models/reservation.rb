class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :diner
  belongs_to :timeslot
end
