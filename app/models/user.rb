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

  def is_admin?
    if role == "admin"
      return true
    end
  end

  def is_medic?
    if role == "medic"
      return true
    end
  end

  def is_manager?
    if role == "manager"
      return true
    end
  end

end
