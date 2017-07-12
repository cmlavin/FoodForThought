class FavoriteRecipe < ApplicationRecord
  belongs_to :reader, :class_name => "User", :foreign_key => "reader_id"
  belongs_to :recipe
end
