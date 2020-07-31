class Image < ApplicationRecord
  belongs_to :post
  mount_uploaders :image, ImageUploader
end
