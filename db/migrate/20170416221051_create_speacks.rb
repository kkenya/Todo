class CreateSpeacks < ActiveRecord::Migration[5.0]
  def change
    create_table :speacks do |t|
      t.references :user, foreign_key: true
      t.references :task, foreign_key: true, null: false
      t.string :comment

      t.timestamps
    end

    add_index :speacks, [:user_id, :task_id]
    add_index :speacks, [:task_id, :user_id]
  end
end
