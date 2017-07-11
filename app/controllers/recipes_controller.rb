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

  def add_ingredient
    if !params[:name].empty?
      @ingredient = Ingredient.find_or_create_by(name: params[:name])
      current_ingredients << @ingredient.id
    end
    current_ingredients = handle_dem_unchecked_boxes(params[:ingredient_ids]) if params[:ingredient_ids]
    redirect_to new_recipe_path
  end

  def create
    @recipe = Recipe.create(recipe_params)
    current_ingredients.each do |ingredient|
      @recipe.ingredients << Ingredient.find(ingredient)
    end
    session.delete(:ingredients_list)
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
    collection = @recipe.ingredient_ids
    @recipe.ingredient_ids = handle_dem_checked_boxes(params[:recipe][:ingredient_ids], collection)
    redirect_to @recipe
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

private
  def recipe_params
    params.require(:recipe).permit(:name, :instruction, :difficulty, :image_url)
  end

end
