class Worktype < ActiveRecord::Base
	has_many :workrests
	# accept... 讓 Worktype物件存檔時，一起將 workrest存檔
	accepts_nested_attributes_for :workrests, :allow_destroy => true, :reject_if => lambda {|f| f[:rest_minutes].blank? }
end
