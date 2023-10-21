class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    (record.item.user == user) || (record.user == user)
  end

  def create?
    user.present?
  end


  def destroy?
    record.user == user || record.item.user == user
  end
end
