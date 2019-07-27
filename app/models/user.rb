class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :examinations
  has_and_belongs_to_many :locations
  belongs_to :location

  def fullname
    if fname.present? && lname.present?
      "#{fname}" ' ' "#{lname}"
    else
      "#{email}"
    end
  end

end
