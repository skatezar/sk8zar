class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    (record.chatroom.user == user) || (record.chatroom.item.user == user)
  end

end
