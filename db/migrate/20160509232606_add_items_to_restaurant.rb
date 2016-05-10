class AddItemsToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :city, :string
    add_column :restaurants, :state, :string
    add_column :restaurants, :zip, :string
    add_column :restaurants, :latitude, :decimal, :precision => 15, :scale => 13
    add_column :restaurants, :longitude, :decimal, :precision => 15, :scale => 13
    add_column :restaurants, :total_seats, :integer
    add_column :restaurants, :open_timeslot, :integer
    add_column :restaurants, :close_timeslot, :integer
  end
end
