class Standard < ApplicationRecord
  belongs_to :user
  validates :weight, :calorie, :protein, :fat, :carbo , presence: true
end