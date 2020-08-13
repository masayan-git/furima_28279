class ApplicationController < ActionController::Base
  # before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!

  # private

  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == 'admin' && password == '2222'
  #   end
  # end

  protected

  def configure_permitted_parameters
    # binding.pry
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_reading, :last_name_reading, :birthday])
  end
end
