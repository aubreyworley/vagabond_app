class CitiesController < ApplicationController

  def show
    @stories = City.friendly.find(params[:id]).stories
    @city = City.friendly.find(params[:id])
    render :show
  end

end
