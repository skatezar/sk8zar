# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    user = User.first
    # This is how you pass value to params[:user] inside mailer definition!
    UserMailer.with(user: user).welcome
  end

  def itemUploaded
    user = User.first
    item = Item.last
    # This is how you pass value to params[:user] inside mailer definition!
    UserMailer.with(user: user, item: item).itemUploaded

  end

  def messageReceived

    # This is how you pass value to params[:user] inside mailer definition!
    user = User.first
    item = Item.last

    # This is how you pass value to params[:user] inside mailer definition!
    UserMailer.with(user: user, item: item).messageReceived
  end


  def unreadMessage
    user = User.first
    UserMailer.with(user: user).unreadMessage
  end
end
