class ProductMailer < ApplicationMailer
	def destroy_notify(product) # 名字自己取
		# 內文在 view\product_mailer\destroy_notify.html.erb
		@deleted_product = product
		mail(to:'genjay@gmail.com', from:'gj@ruby.com',subject:'hello')
	end
end
