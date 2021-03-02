class ChangeIngredientColumnsNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :ingredients, :name, false
  end
end
