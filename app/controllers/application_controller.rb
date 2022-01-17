class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    [:sign_in, :sign_up].each do |variable|
      devise_parameter_sanitizer.permit(variable) do |user_params|
        user_params.permit(:email, :admin, :password, :password_confirmation)
      end
    end
    
  end
end
