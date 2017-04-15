class AddOpenToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :open, :boolean, default: true, null: false
  end
end
