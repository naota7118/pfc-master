# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :user

  validates :food, presence: true
  validates :calorie, presence: true

  # 「もし体重が入力されていたら」という条件分岐を設定したい
  # 投稿される体重は30以上120未満でなければならないというバリデーション
  validates :weight, numericality: { less_than_or_equal_to: 120, greater_than_or_equal_to: 30}, if: :present_weight?

  def present_weight?
    weight.present?
  end

  # # 投稿されるカロリーは0以上10000未満でなければならないというバリデーション
  # validates :calorie, numericality: { less_than_or_equal_to: 10000, greater_than_or_equal_to: 0}
  # # 投稿されるタンパク質量は0以上500未満でなければならないというバリデーション
  # validates :protein, numericality: { less_than_or_equal_to: 500, greater_than_or_equal_to: 0}
  # # 投稿される脂質量は0以上500未満でなければならないというバリデーション
  # validates :fat, numericality: { less_than_or_equal_to: 500, greater_than_or_equal_to: 0}
  # # 投稿される炭水化物量は0以上500未満でなければならないというバリデーション
  # validates :carbo, numericality: { less_than_or_equal_to: 500, greater_than_or_equal_to: 0}

  mount_uploader :image, ImageUploader
end
