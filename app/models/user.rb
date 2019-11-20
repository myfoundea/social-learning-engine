class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates_uniqueness_of :username
  validates_presence_of :username
  
  has_many :posts, dependent: :destroy       
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post

  # user is following through followed
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed  

  # user is followed by followers
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower


  # Returns a user's status feed.
  def feed
      Post.where("user_id IN (:following_ids) OR user_id = :user_id",
      following_ids: following_ids, user_id: id)
  end

  def points
    a = 0
    self.posts.each do |post|
      a += post.fans.size
    end
    return a
  end

  
    # Follows a user.
    def follow(other_user)
      following << other_user
    end
  
    # Unfollows a user.
    def unfollow(other_user)
      following.delete(other_user)
    end
  
    # Returns true if the current user is following the other user.
    def following?(other_user)
      following.include?(other_user)
    end

end
