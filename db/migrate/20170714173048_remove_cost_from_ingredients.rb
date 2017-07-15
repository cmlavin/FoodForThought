class RemoveCostFromIngredients < ActiveRecord::Migration[5.1]
  def change
    remove_column :ingredients, :cost, :float
  end
end
