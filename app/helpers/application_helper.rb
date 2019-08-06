module ApplicationHelper
  def full_title page_title
    base_title = I18n.t "helpers.base_title"
    if page_title.blank?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def total_price quantity, price
    @total_price = quantity * price
  end

  def total_cart products
    products.detail_orders.reduce(0) do |s, p|
      s + (p.current_price * p.quantity)
    end
  end
end
