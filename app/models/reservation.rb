class Reservation < ActiveRecord::Base
  has_many :seats
  belongs_to :user
end
