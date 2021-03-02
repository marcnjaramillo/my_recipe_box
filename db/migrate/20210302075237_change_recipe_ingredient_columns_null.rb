class ChangeRecipeIngredientColumnsNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :recipe_ingredients, :quantity, false
  end
end
