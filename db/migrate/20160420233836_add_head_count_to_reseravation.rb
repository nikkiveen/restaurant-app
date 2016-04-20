class AddHeadCountToReseravation < ActiveRecord::Migration
  def change
    add_column :reservations, :head_count, :integer
  end
end
