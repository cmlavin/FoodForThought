class CreateFavoriteStories < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_stories do |t|
      t.integer :reader_id
      t.integer :story_id
    end
  end
end
