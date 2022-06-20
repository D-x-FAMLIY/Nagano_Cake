class Public::CartItemsController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find(cart_item_params[:product_id])
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:product_id, :quantity)
  end
end
