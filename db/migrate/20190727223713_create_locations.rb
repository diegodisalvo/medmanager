class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :title, default: ""
      t.string :address, default: ""
      t.timestamps
    end
    add_column :examinations, :location_id, :integer, uniq: true
    add_index :examinations, :location_id
  end
end
