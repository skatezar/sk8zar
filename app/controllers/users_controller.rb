class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: [:show, :edit, :update, :showUser, :set_expo_token, :myorders, :myclaims]
  skip_before_action :authenticate_user!, only: [:showSeller, :showUser, :set_expo_token, :myorders, :myclaims]
  skip_before_action :verify_authenticity_token, only: [:set_expo_token]


  def show
    @user = current_user
  end

  def edit
    @user = current_user
    @items = Item.all
  end

  def showSeller
    item = Item.find(params[:id])
    @user = item.user
    @items = Item.where(user: @user)
    authorize @user
  end

  def myItems
    @user = current_user
    @items = Item.where(user: @user)
    @skatespots = Skatespot.where(user: @user)
    authorize @user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to my_profile_path
  end

  def showUser
    @user = User.find(params[:id])
    @items = Item.where(user: @user)
  end

  def myorders
    @orders = Skatezarcoinorder.where(user_id: current_user.id)
  end

  def myclaims
    @claims = Claim.where(user_id: current_user.id)
  end

  def set_expo_token
    @user = User.find(params[:id])
    new_expo_token = params[:expo_push_token]
    if @user.expo_push_token.present? || @user.expo_push_token != new_expo_token
      if @user.update(expo_push_token: new_expo_token)
        render json: {message: 'Ok'}
      else
        render json: {message: 'Error'}
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :instagram, :username, :stance, :userphoto, :description, :instavideolink, :location)
  end
end
