class Restaurant < ActiveRecord::Base
  belongs_to :restaurant_admin
  has_many :seats
end
