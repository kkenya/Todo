class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.references :user, null: false       #外部キー
      t.string :title, null: false          #タイトル
      t.text :memo                          #補足
      t.datetime :released_at, null: false  #開始時間
      t.datetime :expired_at, null: false   #終了時間

      t.timestamps
    end
  end
end
