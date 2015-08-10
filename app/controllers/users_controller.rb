class UsersController < ApplicationController
  before_filter :authorize, only: [:show]
	def new
    if current_user
      redirect_to profile_path
    else
    @user = User.new
    render :new
    end
  end

  def create
    if current_user
      redirect_to profile_path
    else 
      user=User.new(user_params)
  	if user.save 
  		session[:user_id] = user.id
  		redirect_to profile_path
  	else
  		redirect_to signup_path
  	 end
    end	
  end

  def show
    render :show
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :current_city, :join_date, :email, :password)
    end

end
