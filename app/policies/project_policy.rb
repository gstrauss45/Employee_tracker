class ProjectPolicy < ApplicationPolicy
  def index?
    user.project_manager?
  end

  def show?
    user.project_manager?
  end

  def create?
    user.project_manager?
  end

  def new?
    user.project_manager?
  end

  def update?
    user.project_manager?
  end

  def edit?
    user.project_manager?
  end

  def destroy?
    user.project_manager?
  end

  def add?
    user.project_manager?
  end

  def remove?
    user.project_manager?
  end
end
