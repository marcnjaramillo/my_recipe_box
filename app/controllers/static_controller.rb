class StaticController < ApplicationController
  def home
    @recipes = Recipe.all
  end

  def profile
    @user = User.find(params[:id])
  end
end