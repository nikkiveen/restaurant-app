class Timeslot < ActiveRecord::Base
  has_many :reservations
end
