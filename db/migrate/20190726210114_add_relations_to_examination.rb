class AddRelationsToExamination < ActiveRecord::Migration[6.0]
  def change
    add_column :examinations, :patient_id, :integer, uniq: true
    add_column :examinations, :user_id, :integer, uniq: true
    add_index :examinations, :patient_id
    add_index :examinations, :user_id
  end
end
