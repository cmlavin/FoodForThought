class RecipeStory < ApplicationRecord
  belongs_to :story
  belongs_to :recipe
end
