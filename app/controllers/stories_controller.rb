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
    if current_user
      story = current_user.stories.new(story_params)
      story.save
      redirect_to story_path(story)
    else
      redirect_to login_path
    end
    # @story.user = current_user
    # redirect_to story_path(story)
  end

  def show
    @story = Story.friendly.find(params[:id])
    render :show
  end

  def edit
    @user = current_user
    @story = Story.friendly.find(params[:id])
    if current_user.stories.include? @story
      render :edit
    else 
      session[:user_id] = nil
      redirect_to profile_path
    end
  end

  def update
    @user = current_user
    story = Story.friendly.find(params[:id])
    if current_user.stories.include? story
      story.update_attributes(story_params)
      redirect_to story_path(story)
    else
      redirect_to profile_path
    end
  end

  def destroy
    @user = current_user
    story = Story.friendly.find(params[:id])
    # if current_user.stories.include? story
      story.destroy
      # redirect_to story_path(story)
    # else 
      redirect_to profile_path
    # end
  end

  # def destroy
  #   story = Story.find(params[:id])
  #   if current_user.stories.include? story
  #     story.destroy
  #     redirect_to profile_path
  #   else
  #     # if user tries to destroy recipe that doesn't belong to them
  #     # log them out
  #     session[:user_id] = nil
  #     redirect_to login_path
  #   end
  # end


  private
    def story_params
      params.require(:story).permit(:author, :title, :body, :city_id)
    end
end
