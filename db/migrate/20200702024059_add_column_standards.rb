# frozen_string_literal: true

class AddColumnStandards < ActiveRecord::Migration[5.2]
  def up
    add_column :standards, :bodyFatPercentage, :integer
    add_column :standards, :leanBodyMass, :integer
  end

  def down
    remove_column :standards, :bodyFatPercentage, :integer
    remove_column :standards, :leanBodyMass, :integer
  end
end
