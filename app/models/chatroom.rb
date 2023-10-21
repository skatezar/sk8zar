class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :item
  belongs_to :user
  accepts_nested_attributes_for :messages

  def get_chatroom_users
    messages.map { |message| message.user }.uniq
  end
end
