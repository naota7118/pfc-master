class Post < ApplicationRecord
  validates :food, presence: true
  validates :calorie, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :user
  
  mount_uploader :image, ImageUploader

end