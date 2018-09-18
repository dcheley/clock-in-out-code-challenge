class AddDateColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :date_created, :date
  end
end
