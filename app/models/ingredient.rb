class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  @@allergy_types = ["peanuts", "shellfish", "dairy", "egg", "soy", "wheat", "tree nuts", "corn", "garlic"]

  def self.allergy_types
    @@allergy_types
  end

end
