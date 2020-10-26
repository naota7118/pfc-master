class ChangeDataLeanBodyMassToStandard < ActiveRecord::Migration[5.2]
  def change
    change_column :standards, :leanBodyMass, :float
  end
end
