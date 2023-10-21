class EmailForUnreadMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    puts "starting job"
    begin
      email_for_message(message)
    rescue
      puts "email sending failed for message #{message.id}"
    end
    puts "job is done"
  end

  def email_for_message(message)
    p message
    if message.user_id == message.chatroom.item.user.id
      UserMailer.with(user: User.find(message.chatroom.user.id)).unreadMessage.deliver_now
    elsif message.user_id == message.chatroom.user.id
      UserMailer.with(user: User.find(message.chatroom.item.user.id)).unreadMessage.deliver_now
    end
    message.maildelivered = true
    message.save
  end

end
