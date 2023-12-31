class SkateeventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def edit?
    record.user == user
  end

  def update?
    edit?
  end

  def show?
    return true
  end

  def destroy?
    record.user == user
  end

  def index?
    return true
  end

end
