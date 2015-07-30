class User < ActiveRecord::Base
	has_many :stores
	has_one :store
end
