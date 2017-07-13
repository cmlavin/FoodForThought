class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = current_user
    @recipes = Recipe.all.select do |recipe|
      recipe.author_id == @user.id
    end
    @stories = Story.all.select do |story|
      story.author_id == @user.id
    end
    @fav_recipe = @user.fav_recipes.select do |fav_recipe|
      Recipe.find(fav_recipe.id)
    end
    @fav_story = @user.fav_stories.select do |fav_story|
      Story.find(fav_story.id)
    end
  end

  def index
    @users = User.all
  end

  def create
    @user = User.create(user_params)
    redirect_to login_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password, :first_name, :last_name)
  end

end
