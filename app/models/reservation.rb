class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :diner
  belongs_to :timeslot

  validates :diner_name, presence: true
  validates :diner_phone, presence: true
end
