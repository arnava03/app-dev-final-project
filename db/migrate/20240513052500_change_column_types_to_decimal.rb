class ChangeColumnTypesToDecimal < ActiveRecord::Migration[7.0]
  def change
    def change
      change_column :buildings, :xcoord, :decimal
      change_column :buildings, :ycoord, :decimal
    end
  end
end
