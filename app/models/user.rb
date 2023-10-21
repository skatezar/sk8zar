class User < ApplicationRecord
  after_create :send_welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :userphoto
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items, dependent: :destroy
  has_many :chatrooms
  has_many :contests
  has_many :skatespots
  has_many :donations
  has_many :seller_chatrooms, through: :items, source: :chatrooms
  has_many :communitytasks
  has_many :claims
  has_many :skatezarcoinorders
  has_many :skateevents

  def received_messages
    unread_seller_messages + unread_buyer_messages
  end

  #type could be all, buyer, seller
  def unread_messages?(type = :all)
    if type == :buyer
      unread_buyer_messages.any?
    elsif type == :seller
      unread_seller_messages.any?
    else
      received_messages.any?
    end
  end

  def unread_seller_messages
    Message.joins(:item).where("items.user_id = ?", id).where.not(user: self).where(read: false)
  end

  def unread_buyer_messages
    Message.joins(:chatroom).where("chatrooms.user_id = ?", id).where.not(user: self).where(read: false)
  end

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
end
