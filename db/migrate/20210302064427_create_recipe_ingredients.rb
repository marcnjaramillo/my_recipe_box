class CreateRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_ingredients do |t|
      t.string :quantity
      t.references :recipe_id
      t.references :ingredient_id
      t.timestamps
    end
  end
end
