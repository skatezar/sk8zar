namespace :message do
  desc "sending emails to users with unread messages"
  task send_email_for_all_unread: :environment do
    messages = Message.where(read: false, maildelivered: false)
    messages.each do |message|
      EmailForUnreadMessageJob.perform_later(message)
    end
  end
end
