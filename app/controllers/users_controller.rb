class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user


  def show
    @recipes = current_user.recipes
  end

  def following
    @title = "Following"
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @users = @user.followers
    render 'show_follow'
  end

  private

  def set_user
    @user = User.find_by(username: params[:username])
  end
end