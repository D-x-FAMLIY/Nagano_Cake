class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
    @address = current_customer.address
  end

  def confirm
    @addresses = current_customer.addresses
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) {|sum, product| sum + product.subtotal }
    @order.postage = 800
    @order_new = Order.new
    if params[:order][:order_address] == "1"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:order_address] == "2"
      @select_address = current_customer.addresses.find(params[:order][:address_id])
      @order.post_code = @select_address.post_code
      @order.name = @select_address.name
      @order.address = @select_address.address
    elsif params[:order][:order_address] == "3"
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        ProductOrder.create!(
          product_id: cart_item.product_id,
          order_id: @order.id,
          quantity: cart_item.quantity,
          price: cart_item.product.with_tax_price,
          making_status: "no_making"
        )
        # @product_order = ProductOrder.new
        # @product_order.product_id = cart_item.product_id
        # @product_order.order_id = @order.id
        # @product_order.quantity = cart_item.quantity
        # @product_order.price = cart_item.product.with_tax_price
        # @product_order.making_status = "no_making"
        # @product_order.save
      end
      current_customer.cart_items.destroy_all
      redirect_to public_orders_complete_path
    else
      render :new
    end
  end

  def complete
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order.postage = 800
    @order.total = @order.total + @order.postage
  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :name, :post_code, :address, :postage, :total, :status)
  end
end
