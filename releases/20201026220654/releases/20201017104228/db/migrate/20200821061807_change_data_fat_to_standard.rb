class ChangeDataFatToStandard < ActiveRecord::Migration[5.2]
  def change
    change_column :standards, :fat, :float
  end
end
