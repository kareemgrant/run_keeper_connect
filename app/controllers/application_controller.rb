class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user || User.find(session[:user_id]) if session[:user_id]
  end

  def not_authenticated
    redirect_to root_path, alert: "You do not have access to this page"
  end

  def require_current_user
    not_authenticated unless current_user
  end

  helper_method :current_user
end
