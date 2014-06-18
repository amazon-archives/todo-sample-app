class AddCompletedFlagToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :completed_flag, :boolean, default: false
  end
end
