class RemoveImageFromPosts < ActiveRecord::Migration[5.2]
  def up
    remove_column :posts, :image, :string
  end

  def down
    remove_column :posts, :image, :string
  end
end
