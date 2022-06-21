class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = current_customer.address
  end
  
  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.all
    @order.post_code = current_customer.post_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
  end

  def complete
  end
  
  def index
  end

  def show
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
  end

  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :name, :post_code, :address)
  end
end
