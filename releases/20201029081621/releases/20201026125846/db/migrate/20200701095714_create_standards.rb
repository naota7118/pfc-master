# frozen_string_literal: true

class CreateStandards < ActiveRecord::Migration[5.2]
  def change
    create_table :standards do |t|
      t.integer :weight
      t.integer :calorie
      t.integer :protein
      t.integer :fat
      t.integer :carbo
      t.references :user
      t.timestamps
    end
  end
end
