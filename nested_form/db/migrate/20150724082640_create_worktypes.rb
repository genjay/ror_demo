class CreateWorktypes < ActiveRecord::Migration
  def change
    create_table :worktypes do |t|
      t.string :uid
      t.string :name
      t.time :begin_at
      t.time :end_at

      t.timestamps null: false
    end
  end
end
