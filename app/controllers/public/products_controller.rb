class Public::ProductsController < ApplicationController

  def index
    @genres = Genre.all
    @products = Product.where(is_active: true)
    @products = Product.page(params[:page]).per(10)
  end

  def show
    @genres = Genre.all
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

   private
   def product_params
     params.require(:product).permit(:image, :name, :introduction, :price_without_tax)
   end
end
