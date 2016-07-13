class UsersController < ApplicationController
	before_action :require_login, only: [:index]
	before_action :skip_if_logged_in, only: [:new]
  def new
    @user = User.new
  end

  def index
    @users = User.all.shuffle
  end

 	def create
 	 @user = User.new(user_params)
 	 if @user.save
 	 	session[:user_id] = @user.id
 	 	redirect_to users_path
 	 else
 	 	flash[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
 	 	render 'new'
 	 end
 	end

 	private 

 	def user_params
 		params.require(:user).permit(:email, :password, :name, :password_confirmation, :image_url)
 	end
end
