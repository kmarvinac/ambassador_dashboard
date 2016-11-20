class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:school_id, :first_name, :last_name, :cell_phone_number])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:school_id, :first_name, :last_name, :cell_phone_number])
  end
end
