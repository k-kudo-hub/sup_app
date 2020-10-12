class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :staff_number, :email, :password, :password_confirmation, :position_id, :qualification_id, :work_style_id,:picture])  
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :name_kana, :staff_number, :email, :password, :password_confirmation, :position_id, :qualification_id, :work_style_id,:picture])  
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
