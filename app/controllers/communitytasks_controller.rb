class CommunitytasksController < ApplicationController
  include Pundit
  skip_after_action :verify_authorized, only: [:index, :show]

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @communitytasks = policy_scope(Communitytask)
  end

  def show
    @communitytask = Communitytask.find(params[:id])
    authorize @communitytask
  end

  def new
    @communitytask = Communitytask.new
    authorize @communitytask
  end

  def create
    @communitytask = Communitytask.new(communitytask_params)
    @user = current_user
    @communitytask.user = @user
    authorize @communitytask
    if @communitytask.save
      # UserMailer.with(user: @user, item: @item).itemUploaded.deliver_later
      redirect_to tasksubmitted_path
    else
      render :new
    end
  end

  def edit
    @communitytask = Communitytask.find(params[:id])
    authorize @communitytask
  end

  def update
    @communitytask = Communitytask.find(params[:id])
    @communitytask.update(communitytask_params)
    authorize @communitytask
    redirect_to communitytask_path(@communitytask)
  end

  def destroy
    @communitytask = Communitytask.find(params[:id])
    @communitytask.destroy

    authorize @communitytask

    redirect_to communitytasks_path
  end

  private

  def communitytask_params
    params.require(:communitytask).permit(:title, :description, :automatic_verification, :verification, :coin_reward)
  end
end
