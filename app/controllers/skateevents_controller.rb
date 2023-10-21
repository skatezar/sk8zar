class SkateeventsController < ApplicationController
  include Pundit
  skip_after_action :verify_authorized, only: [:index, :show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:eventsearch].present?
      location = params[:eventsearch][:location]
      if location
        @pagy, @skateevents = pagy(policy_scope(Skateevent.near(location)))
      else
        @pagy, @skateevents = pagy(policy_scope(Skateevent.all))
      end
    else
      @pagy, @skateevents = pagy(policy_scope(Skateevent))
    end
  end

  def show
    @skateevent = Skateevent.find(params[:id])
    authorize @skateevent
  end

  def new
    @skateevent = Skateevent.new
    authorize @skateevent
  end

  def create
    @skateevent = Skateevent.new(skateevent_params)
    @user = current_user
    @skateevent.user = @user
    authorize @skateevent
    if @skateevent.save
      redirect_to skateevent_path(@skateevent)
      @user.update(coins_earned: @user.coins_earned + 1)
    else
      render :new
    end
  end

  def edit
    @skateevent = Skateevent.find(params[:id])
    authorize @skateevent
  end

  def update
    @skateevent = Skateevent.find(params[:id])
    @skateevent.update(skateevent_params)
    authorize @skateevent
    redirect_to skateevent_path(@skateevent)
  end

  def destroy
    @skateevent = Skateevent.find(params[:id])
    @skateevent.destroy

    authorize @skateevent

    redirect_to skateevent_path
  end

  private

  def skateevent_params
    params.require(:skateevent).permit(:name_title, :date2, :description, :location, :pic1, :pic2, :pic3, :time, :address, :googlemapslink, :contest_or_session, :contest_type, :fblink, :youtubelink)
  end
end
