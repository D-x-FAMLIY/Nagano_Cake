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
    @order.update(status)
    if @order.status == "confirm_payment"
      @order.product_orders.each do |product_order|
        product_order.update(making_status: "wait_making")
      end
    end
    redirect_to admin_order_path(@order)

  end

  private
  def status
    params.require(:order).permit(:status)
  end

end
