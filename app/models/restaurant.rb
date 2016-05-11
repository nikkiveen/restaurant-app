class Restaurant < ActiveRecord::Base
  has_many :images
  has_many :reservations
  has_many :diners, through: :reservations
end
