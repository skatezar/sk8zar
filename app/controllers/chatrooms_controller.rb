class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
    @chatroom.messages.where.not(user: current_user).update(read: true)
  end

  def create
    @item = Item.find(params[:item_id])
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.user = current_user
    @chatroom.item = @item
    @chatroom.name = @item.general_info

    @chatroom.messages.last.user = current_user
    authorize @chatroom
    authorize @item


    if @chatroom.save
      # UserMailer.messageReceived.deliver_later
      UserMailer.with(user: @user, item: @item, chatroom: @chatroom).messageReceived.deliver_later
      notify_other_user
      redirect_to @chatroom
    else
      render "items/show"
    end
  end


  def destroy
    @chatroom = Chatroom.find(params[:id])
    @chatroom.destroy
    authorize @chatroom
    redirect_to chatrooms_path
  end

  private

  def chatroom_params
    params.require(:chatroom)
          .permit(messages_attributes: [:id, :content])
  end

     private

  def notify_other_user
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

