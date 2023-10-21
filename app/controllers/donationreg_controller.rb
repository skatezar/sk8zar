class DonationregController < ApplicationController
    include Pundit
  skip_after_action :verify_authorized, only: [:index, :show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    # we need @restaurant in our `simple_form_for`
    @donation = Donation.find(params[:donation_id])
    @donationreg = Donationreg.new
    authorize @donationreg
  end

  def create
    @donationreg = Donationreg.new(donationreg_params)
    @donation = Donation.find(params[:donation_id])
    @donationreg.donation = @donation
    redirect_to donation_path(@donation)
    authorize @donationreg
  end

  private

  def donationreg_params
    params.require(:donationreg).permit(:content)
  end
end
