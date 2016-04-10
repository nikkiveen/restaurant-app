class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :diner_id
      t.integer :seat_id

      t.timestamps null: false
    end
  end
end
