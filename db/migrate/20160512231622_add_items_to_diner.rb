class AddItemsToDiner < ActiveRecord::Migration
  def change
    add_column :diners, :first_name, :string
    add_column :diners, :last_name, :string
    add_column :diners, :phone, :string
  end
end
