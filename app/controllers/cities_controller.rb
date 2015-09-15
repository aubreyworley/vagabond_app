class CitiesController < ApplicationController

	def new
    @city = City.new
    render :new
  end

  # creates new story in db that belongs to current_user
  def create
    city = City.create(city_params)
    redirect_to city_path(city)
    # @story.user = current_user
    # redirect_to story_path(story)
  end

  def edit
    @city = City.friendly.find(params[:id])
    render :edit
  end

  def update
    city = City.friendly.find(params[:id])
    city.update_attributes(city_params)
    redirect_to city_path(city)
   end



  def show
    @stories = City.friendly.find(params[:id]).stories.order("created_at DESC")
    @city = City.friendly.find(params[:id])
    # @user = User.find_by(:user_id)
    render :show
  end

  private
    def city_params
      params.require(:city).permit(:city_name, :citypic)
    end

end
