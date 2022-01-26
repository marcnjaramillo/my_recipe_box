require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  def setup
    @relationship = Relationship.new(follower_id: users(:one).id, followed_id: users(:two).id)
  end

  test "follower_id is required" do
    @relationship.follower_id = nil

    assert_not @relationship.valid?
  end

  test "followed_id is required" do
    @relationship.followed_id = nil

    assert_not @relationship.valid?
  end
  
  test "user can follow and unfollow other users" do
    user = users(:one)
    second_user = users(:two)

    user.follow(second_user)
    assert user.following?(second_user)

    user.unfollow(second_user)
    assert_not user.following?(second_user)
  end

  test "user cannot follow their own account" do
    user = users(:one)

    user.follow(user)
    assert_not user.following?(user)
  end
end
