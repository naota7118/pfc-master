# frozen_string_literal: true

class ChangeDataWeightToStandard < ActiveRecord::Migration[5.2]
  def change
    change_column :standards, :weight, :float
  end
end
