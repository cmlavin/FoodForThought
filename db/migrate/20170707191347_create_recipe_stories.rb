class CreateRecipeStories < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_stories do |t|
      t.integer :recipe_id
      t.integer :story_id

      t.timestamps
    end
  end
end
