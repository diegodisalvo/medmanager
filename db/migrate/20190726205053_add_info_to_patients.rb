class AddInfoToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :phone, :string, default: ""
    add_column :patients, :gender, :string, default: "M"
    add_column :examinations, :requested_by, :string, default: ""
  end
end
