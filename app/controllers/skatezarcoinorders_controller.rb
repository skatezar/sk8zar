class SkatezarcoinordersController < ApplicationController
  include Pundit
  skip_after_action :verify_authorized, only: [:index, :show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @orders = Skatezarcoinorder.all
  end

  def show
    @order = Skatezarcoinorder.find(params[:id])
    authorize @order
  end

  def new
    @item = Item.find(params[:item_id])
    @order = Skatezarcoinorder.new
    authorize @order
    authorize @item
  end

  def create
    @order = Skatezarcoinorder.new(skatezarcoinorder_params)
    @item = Item.find(params[:item_id])
    @user = current_user
    @order.user_id = @user.id
    @order.item_id = @item.id
    @order.save
    authorize @order
    if @order.save
      current_user.update(coins_expensed: @user.coins_expensed + @item.skatezarcoins)
      redirect_to ordersubmitted_path
    else
      render :new
    end
  end

  def destroy
    @order = Skatezarcoinorder.find(params[:order_id])
    @order.destroy

    authorize @order

    redirect_to allorderscompleted_path
  end


  private

  def skatezarcoinorder_params
    params.require(:skatezarcoinorder).permit(:firstname, :lastname, :address, :country, :postalcode, :message)
  end
end


