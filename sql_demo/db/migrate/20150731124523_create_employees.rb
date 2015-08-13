class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :uid
      t.string :name
      t.integer :department_id

      t.timestamps  
    end
  end
end
