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
    @order_new = Order.new
    @total = @cart_items.inject(0) {|sum, product| sum + product.subtotal }
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to public_orders_complete_path
    else
      render :new
    end
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
    params.require(:order).permit(:customer_id, :payment_method, :name, :post_code, :address, :postage, :total, :status)
  end
end
