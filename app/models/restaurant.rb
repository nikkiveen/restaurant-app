class Restaurant < ActiveRecord::Base
  belongs_to :restaurant_admin
  has_many :images
  has_many :reservations
  has_many :diners, through: :reservations
end
