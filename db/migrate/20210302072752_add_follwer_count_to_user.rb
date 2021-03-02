class AddFollwerCountToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :total_followers_count, :integer, :default => 0
    add_column :users, :total_following_count, :integer, :default => 0    
  end
end
