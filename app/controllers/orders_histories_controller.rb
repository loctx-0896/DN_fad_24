class OrdersHistoriesController < ApplicationController
  def index
    @order_histories = current_user.orders.sort_orders
  end

  def show
    @detail_orders = DetailOrder.find_by_order_id(params[:id])
    return if @detail_orders
    flash[:danger] = t "controllers.orders_history.not_found"
    redirect_to root_path
  end
end
