class Admin::ProductOrdersController < ApplicationController
    before_action :authenticate_admin!

  def update
    @product_order = ProductOrder.find(params[:id])
    @order = @product_order.order
    @product_orders = @order.product_orders
    @product_order.update(making_status)

    if @product_order.making_status == "now_making"
      @order.update(status: "production")
    end

    if @order.product_order.count == @order.product_orders.where(making_status: "complete_making").count
      @order.update(status: "ready_to_ship")
    end

    redirect_to admin_order_path(@order)


  end

  private

    def making_status
        params.require(:product_order).permit(:making_status)
    end
end
