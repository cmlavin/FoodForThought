class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
    @allergy_types = Ingredient.allergy_types
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    redirect_to @ingredient
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)
    redirect_to @ingredient
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to ingredients_path
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def add_ingredient
    if !params[:name].empty?
      @ingredient = Ingredient.find_or_create_by(name: params[:name])
      current_ingredients << @ingredient.id
    end
    current_ingredients = handle_dem_unchecked_boxes(params[:ingredient_ids]) if params[:ingredient_ids]
    redirect_to new_recipe_path
  end

private
  def ingredient_params
    params.require(:ingredient).permit(:name, :cost, :allergen)
  end

end
