# frozen_string_literal: true

class Standard < ApplicationRecord
  belongs_to :user, optional: true
  validates :weight, :calorie, :protein, :fat, :carbo, :bodyFatPercentage, :leanBodyMass, presence: true
end
