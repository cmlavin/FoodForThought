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
    if !params[:name].empty? && !params[:quantity].empty? && !params[:unit].empty?
      @ingredient = Ingredient.find_or_create_by(name: params[:name])
      @quantity = params[:quantity].to_f
      @unit = params[:unit]
      current_ingredients << @ingredient.id
      current_ingredients_hash << {id: @ingredient.id, quantity: @quantity, unit: @unit }
    else
      #throw error, missing name, quantity or units
    end
    handle_the_unchecked_boxes(params[:ingredient_ids]) if params[:ingredient_ids]
    redirect_to new_recipe_path
  end

private
  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity, :unit)
    #:allergen
  end

end
