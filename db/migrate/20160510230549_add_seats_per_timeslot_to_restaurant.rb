class AddSeatsPerTimeslotToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :seats_per_timeslot, :integer
  end
end
