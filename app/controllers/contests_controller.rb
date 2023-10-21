class ContestsController < ApplicationController
  include Pundit
  skip_after_action :verify_authorized, only: [:index]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @participants = policy_scope(Contest)
  end

  def new
    @participant = Contest.new
    authorize @participant
  end

  def create
    @participant = Contest.new(participant_params)
    @user = current_user
    @participant.user = @user

    authorize @participant
    if @participant.save
      redirect_to contests_path
    else
      render :new
    end
  end

  private

  def participant_params
    params.require(:contest).permit(:username)
  end
end
