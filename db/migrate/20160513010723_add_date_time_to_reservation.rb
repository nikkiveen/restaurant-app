class AddDateTimeToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :datetime, :datetime
  end
end
