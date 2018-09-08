class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :user_id

      t.timestamps
    end
  end
end
