class AddTimeToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :time, :time
  end
end
