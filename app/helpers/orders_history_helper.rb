module OrdersHistoryHelper
  def total_price quantity, current_price
    quantity * current_price
  end

  def total_order detail_orders
    detail_orders.reduce(0) do |s, p|
      s + (p.current_price * p.quantity)
    end
  end
end
