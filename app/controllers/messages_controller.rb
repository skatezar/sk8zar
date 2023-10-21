require 'exponent-server-sdk'

class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    authorize @message
    if @message.save
      UserMailer.with(user: @user).messageReceived.deliver_later
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
        )
      notify_other_user

      users = @chatroom.get_chatroom_users
      other_user = users - [current_user]
      other_user = [@chatroom.item.user] if other_user.empty? 
      send_push_notification(other_user.first)

      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render "chatrooms/show"
    end
  end

  
  private

  def message_params
    params.require(:message).permit(:content)
  end

  def send_push_notification(user)
    client = Exponent::Push::Client.new
    if user.expo_push_token.present?
      message = {
        to: user.expo_push_token,
        title: 'You have a new message',
        subtitle: 'Check it on Skatezar', #only IOS
        body: "A user sent you a new message on Skatezar, don't miss it.",
        data: {},
        sound: 'default',
        ttl: 10000,
        # expiration: 1_886_207_332,
        priority: 'default',
        badge: 0, #number to display, 0 clears the badge
      }
      client.send_messages([message])
    end
  end

  def notify_other_user
    @chatroom = Chatroom.find(params[:chatroom_id])
    user = @chatroom.user
    user_seller = @chatroom.item.user
    NotificationChannel.broadcast_to(
      user,
      "A new message!"
    )
    NotificationChannel.broadcast_to(
      user_seller,
      "A new message!"
    )
  end
end
