class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # Avoid old sessions causing error
    rescue ActiveRecord::RecordNotFound
  end

  # To allow usage within /views templates
  helper_method :current_user

  def authorize
    redirect_to login_url, notice: "Login required" unless current_user
  end
end
