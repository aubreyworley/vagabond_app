class UsersController < ApplicationController
	def new
    @user = User.new
    render :new
  end

  def create
  	user = User.new(user_params)
  	if user.save 
  		session[:user_id] = user.id
  		redirect_to profile_path
  	else
  		redirect_to signup_path
  	end
  	
  end

  def show
    @current_user = User.find(session[:user_id])
    render :show
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :current_city, :join_date, :email, :password)
    end

end
