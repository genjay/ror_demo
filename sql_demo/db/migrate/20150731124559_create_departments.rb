class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :uid
      t.string :name
      t.integer :employees_count

      t.timestamps  
    end
  end
end
