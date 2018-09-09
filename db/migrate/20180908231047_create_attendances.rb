class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.datetime :time
      t.integer :status
      t.integer :user_id

      t.timestamps
    end
  end
end
