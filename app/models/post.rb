# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :user

  validates :food, presence: true
  validates :calorie, presence: true
  # validates :weight, numericality: { less_than_or_equal_to: 120, greater_than_or_equal_to: 30}
  # validates :calorie, numericality: { less_than_or_equal_to: 10000, greater_than_or_equal_to: 0}
  # validates :protein, numericality: { less_than_or_equal_to: 500, greater_than_or_equal_to: 0}
  # validates :fat, numericality: { less_than_or_equal_to: 500, greater_than_or_equal_to: 0}
  # validates :carbo, numericality: { less_than_or_equal_to: 500, greater_than_or_equal_to: 0}

  mount_uploader :image, ImageUploader
end
