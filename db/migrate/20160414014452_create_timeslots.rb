class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.string :time
      t.integer :restaurant_id
      t.integer :seat_count

      t.timestamps null: false
    end
  end
end
