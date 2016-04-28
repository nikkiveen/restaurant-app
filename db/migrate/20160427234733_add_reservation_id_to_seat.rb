class AddReservationIdToSeat < ActiveRecord::Migration
  def change
    add_column :seats, :reservation_id, :integer
  end
end
