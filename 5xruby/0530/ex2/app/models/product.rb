class Product < ActiveRecord::Base
	# belongs_to :store

	has_many :warehouses
	has_many :stores, through: :warehouses

  scope :special_offer, -> { where("price>10")}
  scope :over_price, ->(p) { where(["price>?", p])}
	# def self.special_offer
	# # Product.special_offer 
	#   where("price > 10")
	# end
end
