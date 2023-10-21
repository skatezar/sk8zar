class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :store_user_location!, if: :storable_location?
  before_action :authenticate_user!
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private


  #Make sure your production DOMAIN variable is set with your domain name.
  #If you deploy your code with Heroku for instance, just type in your terminal:
  #heroku config:set DOMAIN=www.my_product.com



  def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
