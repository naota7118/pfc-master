class Post < ApplicationRecord
  validates :food, presence: true
  validates :calorie, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :user
  
  mount_uploader :image, ImageUploader
  
  # 画像の複数枚投稿に必要な記述
  # has_many :images, dependent: :destroy
  # accepts_nested_attributes_for :images
end