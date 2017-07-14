class Recipe < ApplicationRecord
  has_many :recipe_stories
  has_many :stories, through: :recipe_stories
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  validates :name, :instruction, :difficulty, presence: true
  validate :more_than_one_ingredient

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

  def more_than_one_ingredient
    if recipe.ingredients.length <= 1
      errors.add(:ingredient, "Input at least 2 ingredients")
    end
  end

end
