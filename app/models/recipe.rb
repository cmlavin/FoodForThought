class Recipe < ApplicationRecord
  has_many :recipe_stories
  has_many :stories, through: :recipe_stories
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

end
