class AddColumnUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :twitterId, :string
    add_column :users, :twitterNickname, :string
    add_column :users, :twitterName, :string
  end

  def down
    remove_column :users, :twitterId, :string
  end
end
