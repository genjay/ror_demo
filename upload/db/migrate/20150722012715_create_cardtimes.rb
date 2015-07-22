class CreateCardtimes < ActiveRecord::Migration
  def change
    create_table :cardtimes do |t|
      t.integer :ou_id
      t.string :cardno
      t.string :cardtime
      t.text :up_data

      t.timestamps #null: false
    end
  end
end
