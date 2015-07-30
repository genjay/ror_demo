class CreateWarehouses < ActiveRecord::Migration
  def change
    create_table :warehouses do |t|
      t.integer :product_id, index:true
      t.integer :store_id, index:true

      t.timestamps null: false
    end
  end
end
