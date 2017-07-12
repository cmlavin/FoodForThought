class FavoriteRecipe < ApplicationRecord
  belongs_to :user, :foreign_key => "reader_id"
  belongs_to :recipe
end
