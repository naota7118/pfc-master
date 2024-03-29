# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :food, null: false
      t.integer :calorie, null: false
      t.integer :protein
      t.integer :fat
      t.integer :carbo
      t.text :text
      t.string :image
      t.timestamps
    end
  end
end
