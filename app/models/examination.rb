class Examination < ApplicationRecord
  belongs_to :patient
  belongs_to :user
  belongs_to :location
end
