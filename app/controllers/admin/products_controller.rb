class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    render admin_product_path
  end


  def show
    # 商品の新規作成してから
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product =  Product.find(params[:id])
    @product.update(product_params)
    render admin_products_path
  end


  private

  # def product_params
  #   params.require(:product).permit(:image,:name,:introduction,:price_without_tax)
  # end



end
