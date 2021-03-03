class StaticController < ApplicationController
  def home
    @recipes = Recipe.all
  end
end