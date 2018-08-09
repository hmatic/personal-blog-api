class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def create?
    true
  end

  def show?
    record == user
  end

  def update?
    record == user
  end

  def destroy?
    user.admin? ||
    record == user
  end
end