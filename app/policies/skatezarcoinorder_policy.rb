class SkatezarcoinorderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
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
    true
  end

end
