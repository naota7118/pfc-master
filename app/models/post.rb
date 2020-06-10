class Post < ApplicationRecord
  validates :food, presence: true
  validates :calorie, presence: true

  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :user

  accepts_nested_attributes_for :images
  mount_uploader :image, ImageUploader
end
