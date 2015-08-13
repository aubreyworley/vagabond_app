class CitiesController < ApplicationController

  def show
    @stories = City.friendly.find(params[:id]).stories
    @city = City.friendly.find(params[:id])
    # @user = User.find_by(:user_id)
    render :show
  end

end
