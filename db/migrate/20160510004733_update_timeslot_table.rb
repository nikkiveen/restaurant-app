class UpdateTimeslotTable < ActiveRecord::Migration
  def change
    remove_column :timeslots, :time, :time
    remove_column :timeslots, :seat_count, :integer
    remove_column :timeslots, :restaurant_id, :integer
    add_column :timeslots, :time, :string
  end
end
