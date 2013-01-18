class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login

  private

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  helper_method :current_user

  def require_login
    redirect_to new_session_path unless current_user
  end
end
