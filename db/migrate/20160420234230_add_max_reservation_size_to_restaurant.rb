class AddMaxReservationSizeToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :max_reservation_size, :integer
  end
end
