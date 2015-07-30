class Store < ActiveRecord::Base
	belongs_to :user
	# has_many :products 


	has_many :products, through: :warehouses
	has_many :warehouses
end
