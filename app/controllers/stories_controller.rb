class StoriesController < ApplicationController

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
    @user = current_user
    @recipes = current_recipes.map do |recipe|
      Recipe.find(recipe)
    end
  end

  def create
    @story = Story.new(story_params)
    @story.author_id = current_user.id
    current_recipes.each do |recipe|
      @story.recipes << Story.find(recipe)
    end
    @story.save
    reset_session
    redirect_to @story
  end

  def show
    @story = Story.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    @story.update(story_params)
    redirect_to @story
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to stories_path
  end

  def favorite
    @story = Story.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.fav_stories << @story
      redirect_back fallback_location: @story
    elsif type == "unfavorite"
      current_user.fav_stories.delete(@story)
      redirect_back fallback_location: @story
    end
  end

  private

  def story_params
    params.require(:story).permit(:title, :content, :publish_date)
  end

end
