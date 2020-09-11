class ChangeForeignKeyUserIdColumn < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :comments, :user_id
  end
end
