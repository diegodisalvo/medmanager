class AddBirthDateToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :birth_date, :date
  end
end
