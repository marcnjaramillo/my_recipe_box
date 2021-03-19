class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :profile_image
  has_many :recipes, dependent: :destroy
  has_many :comments
  has_many :followers, class_name: "Follower", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :followers, source: :following

  def self.roles
    ['Admin', 'User']
  end

  def total_followers
    Follower.where(follower_id: self.id).count
  end

  def total_following
    Follower.where(following_id: self.id).count
  end
end
