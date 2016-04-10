class Seat < ActiveRecord::Base
  belongs_to :restaurant
  has_many :reservations
  has_many :diners, through: :reservations
end
