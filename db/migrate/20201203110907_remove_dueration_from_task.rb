class RemoveDuerationFromTask < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :dueration, :time
  end
end
