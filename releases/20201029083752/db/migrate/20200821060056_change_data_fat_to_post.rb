# frozen_string_literal: true

class ChangeDataFatToPost < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :fat, :float
  end
end
