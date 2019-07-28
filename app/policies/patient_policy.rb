class PatientPolicy < ApplicationPolicy
  def search?
    user.is_admin? || user.is_medic?
  end
end
