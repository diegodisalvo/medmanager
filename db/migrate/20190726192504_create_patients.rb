class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :fname, default: ''
      t.string :lname, default: ''
      t.string :fiscalcode, default: ''
      t.string :address, default: ''
      t.string :city, default: ''
      t.string :province, default: ''
      t.timestamps
    end
  end
end
