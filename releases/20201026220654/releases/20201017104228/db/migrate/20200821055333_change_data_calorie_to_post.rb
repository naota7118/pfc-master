class ChangeDataCalorieToPost < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :calorie, :float
  end
end
