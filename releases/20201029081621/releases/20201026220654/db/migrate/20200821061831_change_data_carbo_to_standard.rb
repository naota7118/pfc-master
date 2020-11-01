# frozen_string_literal: true

class ChangeDataCarboToStandard < ActiveRecord::Migration[5.2]
  def change
    change_column :standards, :carbo, :float
  end
end
