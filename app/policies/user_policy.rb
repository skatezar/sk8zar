class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def showSeller?
    return true
  end

  def myItems?
    return true
  end

  def selleritems?
    return true
  end



end
