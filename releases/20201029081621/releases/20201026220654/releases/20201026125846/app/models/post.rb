# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :user

  validates :food, presence: true
  validates :calorie, presence: true

  mount_uploader :image, ImageUploader
end
