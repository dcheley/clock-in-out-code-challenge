class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.integer :status
      t.integer :user_id

      t.timestamps
    end

    add_index :attendances, :created_at
  end
end
