class CreateTaskEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :task_entries do |t|
      t.references :task 
      t.integer :duration
      t.string :note
      t.time :start_time

      t.timestamps
    end
  end
end
