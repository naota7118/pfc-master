class RemovePfcFromPosts < ActiveRecord::Migration[5.2]
  def up
    remove_column :posts, :protein
    remove_column :posts, :fat
    remove_column :posts, :carbo
  end

  def down
    add_column :posts, :protein, :float
    add_column :posts, :fat, :float
    add_column :posts, :carbo, :float
  end
end
