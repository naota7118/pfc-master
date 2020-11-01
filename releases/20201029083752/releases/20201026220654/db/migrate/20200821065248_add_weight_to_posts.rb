# frozen_string_literal: true

class AddWeightToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :weight, :float
  end
end
