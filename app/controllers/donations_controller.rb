class DonationsController < ApplicationController
  include Pundit
  skip_after_action :verify_authorized, only: [:index, :show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @donations = policy_scope(Donation)
  end

  def show
    @donation = Donation.find(params[:id])
    authorize @donation
  end

  def new
    @donation = Donation.new
    authorize @donation
  end

  def create
    @donation = Donation.new(donation_params)
    @user = current_user
    @donation.user = @user
    authorize @donation
    if @donation.save
      redirect_to donation_path(@donation)
      @user.update(coins_earned: @user.coins_earned + 2)
    else
      render :new
    end
  end

  def edit
    @donation = Donation.find(params[:id])
    authorize @donation
  end

  def update
    @donation = Donation.find(params[:id])
    @donation.update(donation_params)
    authorize @donation
    redirect_to donation_path(@donation)
  end

  def destroy
    @donation = Donation.find(params[:id])
    @donation.destroy

    authorize @donation

    redirect_to donations_path
  end

  private

  def donation_params
    params.require(:donation).permit(:title, :date, :description, :location, :pic1, :pic2, :pic3, :time, :address, :googlemapslink)
  end
end
