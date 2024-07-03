class ApplicationController < ActionController::Base

  helper_method :current_user
 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  def require_user
    redirect_to '/login' unless current_user
  end 

  def require_editor 
    redirect_to '/' unless current_user.editor? 
  end

  def require_admin
    redirect_to '/' unless current_user.admin?
  end

  def admin_authenticated?
    current_user && current_user.admin?
  end

  def authenticate_admin
    unless admin_authenticated?
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end

end
