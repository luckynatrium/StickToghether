class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?, only: [:create]

  protected

  def configure_permitted_parameters
    params[:user][:role] = 'U' unless params[:user].nil?
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role, :age])
  end

end
