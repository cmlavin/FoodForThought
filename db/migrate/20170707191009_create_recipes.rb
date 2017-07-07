class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.text :name
      t.text :instruction
      t.integer :difficulty
      t.text :image_url

      t.timestamps
    end
  end
end
