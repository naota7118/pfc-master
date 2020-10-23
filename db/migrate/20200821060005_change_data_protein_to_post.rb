# frozen_string_literal: true

class ChangeDataProteinToPost < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :protein, :float
  end
end
