class Post < ApplicationRecord
  validates :food, presence: true
  mount_uploader :image, ImageUploader
end
