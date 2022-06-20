class Public::CartItemsController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @cart_items = CartItem.all
  end

  def create
    
    @product = Product.find(cart_item_params[:product_id])
    @cart_item.save
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:product_id, :quantity)
  end
end
