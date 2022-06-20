class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.genre_id = params[:product][:genre_id]
    @product.save
    redirect_to admin_products_path
  end


  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product =  Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_products_path(@product)
  end


  private

  def product_params
    params.require(:product).permit(:image,:name,:introduction,:price_without_tax,:genre_id,:is_active)
  end



end
