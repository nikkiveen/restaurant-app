class AddDinerInfoToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :diner_name, :string
    add_column :reservations, :diner_phone, :string
  end
end
