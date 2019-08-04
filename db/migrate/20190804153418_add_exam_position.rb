class AddExamPosition < ActiveRecord::Migration[6.0]
  def change
    add_column :examinations, :exam_address, :string, default: ""
  end
end
