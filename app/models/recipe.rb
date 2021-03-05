class Recipe < ApplicationRecord
  has_many :recipe_ingredients, inverse_of: :recipe, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :comments, as: :commentable
  has_one_attached :image

  accepts_nested_attributes_for :recipe_ingredients, reject_if: :all_blank, allow_destroy: true

  def self.categories
    ['Breakfast', 'Lunch', 'Dinner', 'Dessert', 'Soup', 'Salad', 'Sauce', 'Appetizer', 'Side Dish']
  end
end
