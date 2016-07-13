class SessionsController < ApplicationController
	before_action :skip_if_logged_in, only: [:new]

  def create
  	if @user = User.find_by_email(params[:email])
  		if @user.authenticate(params[:password])
  			session[:user_id] = @user.id
  			redirect_to users_path, flash: {success: "Welcome back"}
  		else
  			redirect_to login_path, flash: {error: "wrong password"}
  		end
  	else
  		redirect_to login_path, flash: {error: "user not exist"}
  	end
  end

  def new
  end

  def destroy
  	session[:user_id] = nil
  	flash[:success] = "Logged out"
  	redirect_to root_path
  end

  def callback
    if user = User.from_omniauth(env["omniauth.auth"])
      # log in user here
      session[:user_id] = user.id
      redirect_to users_path
    else
      # don't log user in
      redirect_to login_path
    end
  end
end
