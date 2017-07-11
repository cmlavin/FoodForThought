class Recipe < ApplicationRecord
  has_many :recipe_stories
  has_many :stories, through: :recipe_stories
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  

end
