class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.string :status
      t.integer :restaurant_id

      t.timestamps null: false
    end
  end
end
