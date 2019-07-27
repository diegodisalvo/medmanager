class Patient < ApplicationRecord
  has_many :examinations

  def fullname
    "#{fname}" + ' ' + "#{lname}"
  end

  # search
  def self.search(search)
    where("fiscalcode like ?", "#{search}")
  end

  def age
    ((Time.zone.now - birth_date.to_time) / 1.year.seconds).floor
  end
end
