class EmailForAllUnreadMessagesJob < ApplicationJob
  queue_as :default

  def perform
    puts "starting job"
    messages = Message.where(read: false, maildelivered: false)
    messages.each do |message|
      begin
        email_for_message(message)
      rescue
        puts "email sending failed for message #{message.id}"
      end
    end

    puts "job is done"
  end

  def email_for_message(message)
    if message.user_id == message.chatroom.item.user.id
      UserMailer.with(user: User.find(message.chatroom.user.id)).unreadMessage.deliver_now
    elsif message.user_id == message.chatroom.user.id
      UserMailer.with(user: User.find(message.chatroom.item.user.id)).unreadMessage.deliver_now
    end
    message.maildelivered = true
    message.save
  end

end
