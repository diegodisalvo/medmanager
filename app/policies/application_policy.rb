class ApplicationPolicy < ActionPolicy::Base
  authorize :user, allow_nil: true

  def index?
    user.is_admin? || user.is_medic? 
  end

  def show?
    return true
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def edit?
    return true
  end

  def update?
    return true
  end

  def delete?
    return true
  end

  def destroy?
    return true
  end

end
