class AddDateToSeats < ActiveRecord::Migration
  def change
    add_column :seats, :date, :date
  end
end
