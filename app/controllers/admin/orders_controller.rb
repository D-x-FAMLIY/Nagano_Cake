class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @order = Order.find(params[:id])
    @product_orders = @order.product_orders
  end

  def top
    # ページネーション記述(仮)
    @orders = Order.page(params[:page]).per(10)
  end

  def update
    @order = Order.find(params[:id])
    if params[:order][:status] == "confirm_payment"
      @order.update(status)
      @order.product_orders.each do |product_order|
        product_order.update(making_status: "wait_making")
      end
      redirect_to admin_order_path(@order)
    else @order.update(status)
      redirect_to admin_order_path(@order)
    end
  end

  private
  def status
    params.require(:order).permit(:status)
  end

end
