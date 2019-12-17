class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    params[:user][:role] = 'U'
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role, :age])
  end

end
