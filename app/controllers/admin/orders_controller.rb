class Admin::OrdersController < ApplicationController
  def show
  end

  def top
    # ページネーション記述(仮)
    @orders = Order.page(params[:page]).per(10)
  end


end
