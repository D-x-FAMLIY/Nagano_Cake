class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @new_cart_item = CartItem.new(cart_item_params)
    p @new_cart_item
    if CartItem.find_by(product_id: @new_cart_item.product_id, customer_id: current_customer.id)
      @cart_item = CartItem.find_by(product_id: @new_cart_item.product_id, customer_id: current_customer.id)
      @cart_item.quantity +=  @new_cart_item.quantity
      @cart_item.save
    else
      @new_cart_item.save
    end
    redirect_to public_cart_items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:customer_id, :product_id, :quantity)
  end
end
