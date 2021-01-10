# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :user

  validates :food, presence: true

  validates :calorie, presence: true
  # カロリーは必須項目なので他のカラム のような条件分岐はなし
  validates :calorie, numericality: { less_than_or_equal_to: 10000, greater_than_or_equal_to: 0}

  # 投稿される体重は30以上120未満でなければならないというバリデーション
  # 「もし体重が入力されていたら」という条件分岐をifで追記している
  validates :weight, numericality: { less_than_or_equal_to: 120, greater_than_or_equal_to: 30}, if: :present_weight?

  def present_weight?
    weight.present?
  end
  
  # 投稿されるタンパク質量は0以上500未満でなければならないというバリデーション
  validates :protein, numericality: { less_than_or_equal_to: 500, greater_than_or_equal_to: 0}, if: :present_protein?

  def present_protein?
    protein.present?
  end

  # 投稿される脂質量は0以上500未満でなければならないというバリデーション
  validates :fat, numericality: { less_than_or_equal_to: 500, greater_than_or_equal_to: 0}, if: :present_fat?

  def present_fat?
    fat.present?
  end

  # 投稿される炭水化物量は0以上500未満でなければならないというバリデーション
  validates :carbo, numericality: { less_than_or_equal_to: 500, greater_than_or_equal_to: 0}, if: :present_carbo?

  def present_carbo?
    carbo.present?
  end

  # mount_uploader :ファイルを保存するカラム名, アップローダークラス名
  mount_uploader :image, ImageUploader
  # アップロード画像用のカラムとアップローダーカラムを紐付ける

  is_impressionable
end
