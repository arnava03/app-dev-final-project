class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.string :day
      t.time :start_time
      t.time :end_time
      t.integer :classroom_id
      t.string :department
      t.string :coursenum
      t.string :coursename

      t.timestamps
    end
  end
end
