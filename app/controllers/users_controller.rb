class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  # def index
  #   following_ids = Follower.where(follower_id: current_user.id).map(&:following_id)
  #   following_ids << current_user.id
  #   @recipes = Recipe.includes(:user).where(user_id: following_ids)
  #   @follower_suggestions = User.where.not(id: following_ids)
  # end

  def profile
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