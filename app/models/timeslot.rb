class Timeslot < ActiveRecord::Base
  belongs_to :restaurant
  has_many :seats 
end
