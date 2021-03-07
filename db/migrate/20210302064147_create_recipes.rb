class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :prep_time
      t.string :cook_time
      t.text :directions
      t.string :category
      t.integer :total_likes_count, default: 0
      t.integer :total_comments_count, default: 0
      t.references :user
      t.timestamps
    end
  end
end
