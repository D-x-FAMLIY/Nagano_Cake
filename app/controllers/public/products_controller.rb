class Public::ProductsController < ApplicationController
  def index
    @genres = Genre.all
    @products = Product.all
  end

  def show
    @genres = Genre.all
    @product = Product.find(params[:id])
  end

   private
   def product_params
     params.require(:product).permit(:image, :name, :introduction, :price_without_tax)
   end
end
