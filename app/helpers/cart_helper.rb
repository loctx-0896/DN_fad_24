module CartHelper
  def add_product product_id, quantity = Settings.quantity_product
    check_cookie_cart
    if @products.key? product_id
      @products[product_id] += quantity
    else
      @products[product_id] = quantity
    end
    update_cookie_cart @products
  end

  def check_cookie_cart
    @products = cookies[:products]
    return @products = Hash.new if @products.blank?
    @products = JSON.parse cookies[:products]
  end

  def update_cookie_cart products
    cookies.permanent[:products] = JSON.generate products
  end

  def size_cart
    check_cookie_cart
    @products.size
  end
end
