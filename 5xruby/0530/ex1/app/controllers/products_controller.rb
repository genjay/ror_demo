class ProductsController < ApplicationController
	before_action :find_product, only:[:show, :edit, :update, :destroy]
	
	def index
		@products = Product.all
	end

	def show
		find_product
	end

	def edit
		# @product = Product.find_by(id: params[:id] ) 
		# 	redirect_to products_path, notice:'無此商品' unless @product
	end

	def update 
		# @product = Product.find_by(id: params[:id] ) 
		# 	redirect_to products_path, notice:'無此商品' unless @product

		if @product.update_attributes(product_params)
			redirect_to products_path, notice: '更新成功'
		else
			render :edit
		end

	end

	def new
		@product = Product.new
	end

	def create
		@product =  Product.new(product_params)

		if @product.save
			flash[:notice] = '新增成功'
			redirect_to products_path
		else
			flash[:notice] = '新增失敗'
			# render new_product_path
			render :new # 代表使用 new 這個view，所以前面使用 @product 變數而非 product


		end

		# render text: params
		# @product.save
	end

	def destroy
			# @product = Product.find_by(id: params[:id] ) 
			
		if @product.destroy 
			redirect_to products_path, notice:'已刪除'
		else 
		end
	end

private
	def product_params
		params.require(:product).permit(:name, :description, :price)
	end

	def find_product
		@product = Product.find_by(id: params[:id] ) 
			redirect_to products_path, notice:'無此商品' unless @product
	end

end
