class ChangeDataCalorieToStandard < ActiveRecord::Migration[5.2]
  def change
    change_column :standards, :calorie, :float
  end
end
