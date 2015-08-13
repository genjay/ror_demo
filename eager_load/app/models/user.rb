class User < ActiveRecord::Base
	has_many :addresses
  has_many :polish_addresses, -> {where country: "Poland"}, class_name: "Address"
end
