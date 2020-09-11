class ChangeUserIdOfComments < ActiveRecord::Migration[5.2]
  def change
    change_column_null :comments, :user_id, false, 0
  end
end
