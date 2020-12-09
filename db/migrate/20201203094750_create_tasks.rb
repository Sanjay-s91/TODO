class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :task_note
      t.date :start_date
      t.date :end_date
      t.time :dueration

      t.timestamps
    end
  end
end
