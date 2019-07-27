class AddPositionToExams < ActiveRecord::Migration[6.0]
  def change
    add_column :examinations, :exam_location, :string, default: "Ambulatoriale"
  end
end
