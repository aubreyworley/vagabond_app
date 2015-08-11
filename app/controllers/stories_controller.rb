class StoriesController < ApplicationController
  
  # show all stories in the db
  def index
    @stories = Story.all
    render :index
  end

  # form to create new goal that belongs to current_user
  def new
    @story = Story.new
    render :new
  end

  # creates new story in db that belongs to current_user
  def create
    story = current_user.stories.create(story_params)
    redirect_to story_path(story)
  end

  def show
    render :show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def story_params
      params.require(:story).permit(:author, :title, :body, :location)
    end
end
