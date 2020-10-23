# frozen_string_literal: true

class ChangeDataCarboToPost < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :carbo, :float
  end
end
