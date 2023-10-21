class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @user = params[:user] # Instance variable => available in view
    attachments.inline["swflip.jpg"] = File.read("#{Rails.root}/app/assets/images/swflip.jpg")
    attachments.inline["instagram.png"] = File.read("#{Rails.root}/app/assets/images/instagram.png")
    mail(to: @user.email, subject: 'Welcome to SkateZar!')
  end

  def itemUploaded
    @user = params[:user]
    @item = params[:item]
    mail(to: @user.email, subject: 'Item is uploaded!')
  end

  def messageReceived
   # Instance variable => available in view
    @item = params[:item]
    if @item.present?
      @user = @item.user
    else
      @user = User.find(5)
    end
    @chatroom = params[:chatroom]
    mail(to: @user.email, subject: 'Someone wants to buy your item!')

    # mail(to: 'hi@gmail.com', subject: 'Message re!')
  end

  def unreadMessage
    @user = params[:user]
    mail(to: @user.email, subject: 'unread message')

  end

end
