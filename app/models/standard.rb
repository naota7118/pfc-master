class Standard < ApplicationRecord
  belongs_to :user
  varidates :weight, :calorie, :protein, :fat, :carbo , presence: true
end