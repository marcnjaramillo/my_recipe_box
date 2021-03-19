class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:profile]

  def index
    following_ids = Follower.where(follower_id: current_user.id).map(&:following_id)
    following_ids << current_user.id

    @follower_suggestions = User.where.not(id: following_ids)
  end

  def profile
    @recipes = current_user.recipes
  end

  def follow_user
    follower_id = params[:follow_id]
    if Follower.create!(follower_id: current_user.id, following_id: follower_id)
      flash[:success] = "Now following a new user"
    else
      flash[:danger] = "Something went wrong. Please try again later."
    end
      redirect_to dashboard_path
  end

  def unfollow_user
    follower_id = params[:follow_id]
    if Follower.destroy!(follower_id: current_user.id, following_id: follower_id)
      flash[:success] = "Successfully unfollowed"
    else
      flash[:danger] = "Something went wrong. Please try again later."
    end
      redirect_to dashboard_path
  end

  private

  def set_user
    @user = User.find_by_username(params[:username])
  end
end