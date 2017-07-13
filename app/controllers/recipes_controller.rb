class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = current_ingredients.map do |ingredient|
      Ingredient.find(ingredient)
    end
    @image = Image.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.author_id = current_user.id
    current_ingredients.each do |ingredient|
      @recipe.ingredients << Ingredient.find(ingredient)
    end
    @image = Image.create(image_params)
    @recipe.image_url = @image.image.url
    @recipe.save
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

  def add_recipe
    byebug
    @recipe = Recipe.find(params[:id])
    current_recipes << @recipe.id
    redirect_to new_recipe_path
  end

  def favorite
    @recipe = Recipe.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.fav_recipes << @recipe
      redirect_back fallback_location: @recipe
    elsif type == "unfavorite"
      current_user.fav_recipes.delete(@recipe)
      redirect_back fallback_location: @recipe
    end
  end

private
  def recipe_params
    params.require(:recipe).permit(:name, :instruction, :difficulty, :image_url)
  end

  def image_params
    params[:recipe].require(:image).permit!
  end
end
