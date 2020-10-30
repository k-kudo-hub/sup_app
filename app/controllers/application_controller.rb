class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name name_kana staff_number email password password_confirmation position_id qualification_id work_style_id picture])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name name_kana staff_number email password password_confirmation position_id qualification_id work_style_id picture])
  end
end
