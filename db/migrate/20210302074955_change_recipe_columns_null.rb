class ChangeRecipeColumnsNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :recipes, :name, false
    change_column_null :recipes, :prep_time, false
    change_column_null :recipes, :cook_time, false
    change_column_null :recipes, :directions, false
    change_column_null :recipes, :category, false
  end
end
