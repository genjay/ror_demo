class AddAgeToUser < ActiveRecord::Migration
  def change
  	add_column :users, :age, :integer
  	# add_column :posts, :memo, :text
  end
end
