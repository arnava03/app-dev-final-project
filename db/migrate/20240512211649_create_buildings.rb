class CreateBuildings < ActiveRecord::Migration[7.0]
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :address
      t.integer :classrooms_count

      t.timestamps
    end
  end
end
