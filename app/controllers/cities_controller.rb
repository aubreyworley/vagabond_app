class CitiesController < ApplicationController

  def show
    @stories = City.find(params[])
    render :show
  end

end
