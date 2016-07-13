class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :signed_in?

  def current_user
  	if session[:user_id]
  		User.find session[:user_id]
  	end
  end

  def signed_in?
  	if session[:user_id]
  		return true
  	else
  		return false
  	end
  end

  def require_login
  	unless signed_in?
  		flash[:errors] = "you must log in to access this section"
  		redirect_to login_path
  	end
  end

  def skip_if_logged_in
  	if signed_in?
  		redirect_to users_path
  	end
  end
end
