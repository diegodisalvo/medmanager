class AddDataToUsersAndCorrectPatientsAndExams < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :fname, :string, default: ""
    add_column :users, :lname, :string, default: ""
    add_column :users, :role, :string, default: "medic"

    add_column :examinations, :exam_time, :datetime
  end
end
