class CreateFavoriteRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_recipes do |t|
      t.integer :reader_id
      t.integer :recipe_id
    end
  end
end
