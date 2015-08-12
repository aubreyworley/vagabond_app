class CitiesController < ApplicationController

  def show
    @stories = City.find(params[:id]).stories
    @city = City.find(params[:id])
    render :show
  end

end
