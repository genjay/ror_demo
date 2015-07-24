class CreateWorkrests < ActiveRecord::Migration
  def change
    create_table :workrests do |t|
      t.integer :worktype_id
      t.time :begin_at
      t.integer :rest_minutes

      t.timestamps null: false
    end
  end
end
