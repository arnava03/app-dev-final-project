class UpdateBuildings < ActiveRecord::Migration[7.0]
  def change
    add_column :buildings, :xcoord, :string
    add_column :buildings, :ycoord, :string
  end
end
