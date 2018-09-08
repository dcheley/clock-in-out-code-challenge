class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # To allow usage within /views templates
  helper_method :current_user

  def require_login
    unless current_user
      redirect_to login_url, notice: "Login required"
    end
  end
end
