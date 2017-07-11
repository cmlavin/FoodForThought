class IngredientsController < ApplicationController

  def index
    @ingredient = Ingredient.all
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

private
  def ingredient_params
    params.require(:ingredient).permit(:name, :cost, :allergen)
  end

end
