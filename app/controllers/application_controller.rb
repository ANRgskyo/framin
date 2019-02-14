class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :postal_code, :address, :phone_number, :email,:password,:password_confirmation])
  end
  
  def after_sign_in_path_for(resources)
		user_path(current_user.id)
  end
end