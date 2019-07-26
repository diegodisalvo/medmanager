class Patient < ApplicationRecord
  has_many :examinations

  def fullname
    "#{fname}" + ' ' + "#{lname}"
  end
end
