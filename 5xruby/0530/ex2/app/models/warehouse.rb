class Warehouse < ActiveRecord::Base
	belongs_to :store
	belongs_to :product

	before_save :who_updated  

	def who_updated
		self.updated_by ||= 'Ricky'
	end
end
