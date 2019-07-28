class Patient < ApplicationRecord
  has_many :examinations

  def fullname
    "#{fname}" + ' ' + "#{lname}"
  end

  # search
  def self.search_fiscalcode(search)
    where("fiscalcode like ?", "#{search}")
  end
  def self.search_name(search)
    where("fname ILIKE ? OR lname ILIKE ? OR (fname || ' ' || lname) ILIKE ? OR (lname || ' ' || fname) ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  def age
    ((Time.zone.now - birth_date.to_time) / 1.year.seconds).floor
  end
end
