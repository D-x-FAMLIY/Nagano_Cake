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
    if params[:order][:status] == "confirm_payment"
      @order.update(status)
      @order.product_orders.each do |product_order|
        product_order.update(making_status: "wait_making")
      end
    elsif @order.product_order[:making_status] == "now_making"
      @order.product_order.update(making_status)
      @order.update(status: "production")
    elsif @order.product_orders[:making_status] == "complete_making"
      @product_order.update(making_status)
      @order.update(status: "ready_to_ship")
    elsif params[:order][:status] == "sent"
      @order.update(status)
      @orde.update(status: "sent")
    else
      @order.update
    end
    redirect_to admin_order_path(@order)
  end

  private
  def status
    params.require(:order).permit(:status)
  end

  def making_status
    params.require(:product_order).permit(:making_status)
  end
end
