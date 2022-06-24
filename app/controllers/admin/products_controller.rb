class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    # ページネーション追加
    @products = Product.page(params[:page]).per(10)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.genre_id = params[:product][:genre_id]
    @product.save
    redirect_to admin_product_path(@product)
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
    redirect_to admin_product_path(@product)
  end


  private

  def product_params
    params.require(:product).permit(:image,:name,:introduction,:price_without_tax,:genre_id,:is_active)
  end



end
