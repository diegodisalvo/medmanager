class ChangeRelForCurrentLocation < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :location_id
    add_column :locations, :user_id, :integer, uniq: true
    add_index :locations, :user_id
  end
end
