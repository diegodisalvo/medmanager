class RenameColumnLocation < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :current_location, :location_id
  end
end
