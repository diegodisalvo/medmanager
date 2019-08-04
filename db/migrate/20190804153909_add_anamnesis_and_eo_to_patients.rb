class AddAnamnesisAndEoToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :anamnesis, :text, default: ""
    add_column :patients, :eo, :text, default: ""
    add_column :patients, :notes, :text, default: ""
  end
end
