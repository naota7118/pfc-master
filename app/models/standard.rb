class Standard < ApplicationRecord
  belongs_to :user, optional: true
  varidates :weight, :calorie, :protein, :fat, :carbo ,presence: true
end
