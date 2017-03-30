class RemoveDatetimeFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :released_at, :datetime
    remove_column :tasks, :expired_at, :datetime
  end
end
