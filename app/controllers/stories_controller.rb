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
    @story = Story.find(params[:id])
    render :show
  end

  def edit
    @story = Story.find(params[:id])
    if current_user.stories.include? @stories
      render :edit
    else 
      redirect_to profile_path
    end
  end

  def update
    story = Story.find(params[:id])
    if current_user.stories.include? story
      story.update_attributes(story_params)
      redirect_to story_path(story)
    else
      redirect_to profile_path
    end
  end

  def destroy
    story = Story.find(params[:id])
    if current_user.stories.include? story
      story.delete_attributes(story_params)
      redirect_to story_path(story)
    else 
      redirect_to profile_path
    end
  end

  private
    def story_params
      params.require(:story).permit(:author, :title, :body, :location)
    end
end
