# frozen_string_literal: true

class ChangeDataTypeToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :food, :string
  end
end
