class SwapRelUserLocations < ActiveRecord::Migration[6.0]
  def change
    remove_column :locations, :user_id
    add_column :users, :location_id, :integer, uniq: true
    add_index :users, :location_id
  end
end
