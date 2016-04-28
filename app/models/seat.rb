class Seat < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :reservation
  has_many :diners, through: :reservations
end
