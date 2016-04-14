class AddTimeSlotIdToSeat < ActiveRecord::Migration
  def change
    add_column :seats, :timeslot_id, :integer
  end
end
