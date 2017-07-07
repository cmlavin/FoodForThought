class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.text :name
      t.float :cost
      t.text :allergen

      t.timestamps
    end
  end
end
