class User < ApplicationRecord
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments
  has_many :following_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :following_relationships, source: :following
  has_many :follower_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower
  has_one :standard

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
  
end
