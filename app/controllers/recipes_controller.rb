class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = current_ingredients.map do |ingredient|
      Ingredient.find(ingredient)
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.author_id = current_user.id
    current_ingredients.each do |ingredient|
      @recipe.ingredients << Ingredient.find(ingredient)
    end
    @recipe.save
    byebug
    reset_session
    redirect_to @recipe
  end

  def show
    @recipe = Recipe.find(params[:id])
    #update the date format in the erb
  end

  def edit
    @recipe = Recipe.find(params[:id])
    #update the date format in the erb
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  def add_recipe
    byebug
    @recipe = Recipe.find(params[:id])
    current_recipes << @recipe.id
    redirect_to new_recipe_path
  end

private
  def recipe_params
    params.require(:recipe).permit(:name, :instruction, :difficulty, :image_url)
  end

end
