class AddColumnStartTime < ActiveRecord::Migration[5.2]
  def up
    add_column :posts, :start_time, :timestamp
  end

  def down
    remove_column :posts, :start_time, :timestamp
  end
end
