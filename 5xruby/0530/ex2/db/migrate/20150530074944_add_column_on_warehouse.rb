class AddColumnOnWarehouse < ActiveRecord::Migration
  def change
  	add_column :warehouses, :updated_by, :string
  end
end
