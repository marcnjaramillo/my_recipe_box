class Recipe < ApplicationRecord
  has_many :comments, as: :commentable
end
