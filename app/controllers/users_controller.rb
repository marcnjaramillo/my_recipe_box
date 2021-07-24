class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user


  def show
  
  end

  def recipes
    render 'user_recipes'
  end

  def following
    render 'following'
  end

  def followers
    render 'followers'
  end

  private

  def set_user
    @user = User.find_by(username: params[:username])
  end
end