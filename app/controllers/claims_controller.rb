class ClaimsController < ApplicationController
  include Pundit
  skip_after_action :verify_authorized, only: [:index, :show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @communitytask = Communitytask.find(params[:communitytask_id])
    @claim = Claim.new
    authorize @claim
  end

  def create
    @claim = Claim.new(claim_params)
    @communitytask = Communitytask.find(params[:communitytask_id])
    @claim.communitytask = @communitytask
    @claim.user_id = current_user.id
    if @claim.save
      redirect_to claimsubmitted_path
    else
      render :new
    end
    authorize @claim
  end

  def destroy
    @claim = Claim.find(params[:claim_id])
    @claim.destroy
    authorize @claim
    redirect_to allclaimspending_path
  end

  private

  def claim_params
    params.require(:claim).permit(:content)
  end
end
