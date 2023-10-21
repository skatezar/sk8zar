class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :show]
  def index
    if params[:query].present?
      sql_query = "category ILIKE :query OR
                   condition ILIKE :query OR
                   brand ILIKE :query OR
                   size ILIKE :query OR
                   location ILIKE :query"
      @pagy, @items = pagy  policy_scope(Item).where(sql_query, query: "%#{params[:query]}%").where(sold: false)
    else
      @pagy, @items = pagy policy_scope(Item).order(created_at: :desc).where(sold: false)
    end
  end

  def show
    @item = Item.find(params[:id])
    authorize @item
    if current_user && Chatroom.find_by(user: current_user, item: @item)
      @chatroom = Chatroom.find_by(user: current_user, item: @item)
      @message = Message.new
    else
      @chatroom = Chatroom.new
      @chatroom.messages.build
    end
  end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    # if @item.valid?
    @user = current_user
    @item.user = @user
    @item.tag_list.add(@item.brand, @item.category, @item.size, @item.condition)
    authorize @item
    if @item.save
      UserMailer.with(user: @user, item: @item).itemUploaded.deliver_later
      redirect_to item_path(@item)
      @user.update(coins_earned: @user.coins_earned + 1)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    authorize @item
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    authorize @item
    redirect_to item_path(@item)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    authorize @item

    redirect_to user_my_items
  end

  private

  def item_params
    params.require(:item).permit(:category, :title, :size, :price, :brand, :condition, :photo, :description, :photo2, :photo3, :tag_list, :currency, :location, :specificlocation)
  end
end
