class FollowersController < ApplicationController
  def index
    @user = User.find_by_username(params[:username])
    @followers = @user.followers.following_id
  end
end