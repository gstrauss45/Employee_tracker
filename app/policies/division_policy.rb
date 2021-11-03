class DivisionPolicy < ApplicationPolicy
  def index?
    user.hr_manager?
  end

  def show?
    user.hr_manager?
  end

  def create?
    user.hr_manager?
  end

  def new?
    user.hr_manager?
  end

  def update?
    user.hr_manager?
  end

  def edit?
    user.hr_manager?
  end

  def destroy?
    user.hr_manager?
  end
end
