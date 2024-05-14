class CreateClassrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.integer :building_id
      t.integer :meetings_count

      t.timestamps
    end
  end
end
