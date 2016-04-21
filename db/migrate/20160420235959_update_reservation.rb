class UpdateReservation < ActiveRecord::Migration
  def change
    remove_column :reservations, :time, :time
    add_column :reservations, :timeslot_id, :integer
  end
end
