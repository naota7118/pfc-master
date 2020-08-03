class ChangeColumnToAllownull < ActiveRecord::Migration[5.2]
  def up
    change_column :images, :image,:string, null: true # null: trueを明示する必要がある
  end

  def down
    change_column :images, :image,:string, null: false
  end
end
