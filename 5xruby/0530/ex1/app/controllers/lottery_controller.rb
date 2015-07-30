class LotteryController < ApplicationController
	def index
 	 @balls = (1..48).to_a.sample(6)
	end

	def bmi
	end

	def bmi_result
		height = params[:height].to_f / 100
		weight = params[:weight].to_f
		@bmi = weight / (height*height)
		# render text: params
	end

end
