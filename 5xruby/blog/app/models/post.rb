class Post < ActiveRecord::Base
	belongs_to :user
	# after_initialize :default_values

 
  mount_uploader :cover_image, CoverPageUploader

end
