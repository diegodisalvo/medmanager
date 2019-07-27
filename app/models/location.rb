class Location < ApplicationRecord
  has_many :examinations
  has_and_belongs_to_many :users
end
