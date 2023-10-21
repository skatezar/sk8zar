class SkatespotsController < ApplicationController
  include Pundit
  skip_after_action :verify_authorized, only: [:index, :show]

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:spotsearch].present?
      location = params[:spotsearch][:location]
      type = params[:spotsearch][:type_of_spot]
      if location && type == nil
        @pagy, @skatespots = pagy(policy_scope(Skatespot.near(location)))
      elsif location == "" && type
        @pagy, @skatespots = pagy(policy_scope(Skatespot.where(type_of_spot: type)))

      elsif location && type
        @pagy, @skatespots = pagy(policy_scope(Skatespot.near(location).where(type_of_spot: type)))
      end
    else
      @pagy, @skatespots = pagy(policy_scope(Skatespot))
    end
  end

  def show
    @skatespot = Skatespot.find(params[:id])
    authorize @skatespot
  end

  def new
    @skatespot = Skatespot.new
    authorize @skatespot
  end

  def create
    @skatespot = Skatespot.new(skatespot_params)
    @user = current_user
    @skatespot.user = @user
    authorize @skatespot
    if @skatespot.save
      redirect_to skatespot_path(@skatespot)
      @user.update(coins_earned: @user.coins_earned + 1)
    else
      render :new
    end
  end

  def edit
    @skatespot = Skatespot.find(params[:id])
    authorize @skatespot
  end

  def update
    @skatespot = Skatespot.find(params[:id])
    @skatespot.update(skatespot_params)
    authorize @skatespot
    redirect_to skatespot_path(@skatespot)
  end

  def destroy
    @skatespot = Skatespot.find(params[:id])
    @skatespot.destroy

    authorize @skatespot

    redirect_to root_path
  end

  private

  def skatespot_params
    params.require(:skatespot).permit(:name, :description, :location, :pic1, :pic2, :pic3, :type_of_spot, :address, :googlemapslink)
  end
end
