class CreateFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :followers do |t|
      t.references :follower, references: :user
      t.references :following, references: :user
      t.timestamps
    end
  end
end
