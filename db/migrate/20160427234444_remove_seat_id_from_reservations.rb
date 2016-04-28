class RemoveSeatIdFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :seat_id, :integer
  end
end
