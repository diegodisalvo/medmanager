class CurrentLocationForUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :current_location, :integer, uniq: true
    add_index :users, :current_location
  end
end
