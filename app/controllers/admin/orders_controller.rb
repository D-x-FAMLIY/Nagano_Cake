class Admin::OrdersController < ApplicationController
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
    @order.update(status: @order.status)
    redirect_to admin_order_path(@order)
  end

  private
  def order_status
    params.require(:order).permit(:status)
  end

end
