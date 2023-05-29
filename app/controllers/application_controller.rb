class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_Action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameters.sanitizer.permit(:sign_up, keys: %i[first_name last_name])

    devise_parameters.sanitizer.permit(:account_update, keys: %i[first_name last_name])
  end
end
