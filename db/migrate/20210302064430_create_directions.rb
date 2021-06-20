class CreateDirections < ActiveRecord::Migration[6.1]
  def change
    create_table :directions do |t|
      t.text :body, null: false
      t.references :recipe
      t.timestamps
    end
  end
end
