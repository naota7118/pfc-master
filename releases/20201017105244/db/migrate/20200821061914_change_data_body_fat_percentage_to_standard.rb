class ChangeDataBodyFatPercentageToStandard < ActiveRecord::Migration[5.2]
  def change
    change_column :standards, :bodyFatPercentage, :float
  end
end
