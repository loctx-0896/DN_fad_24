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

  def total_price quantity, price
    @total_price = quantity * price
  end

  def total_cart
    @products.reduce(0) do |s, p|
      s + (p.price * p.total_quantity)
    end
  end

  def update_quantity_product product_id, quantity
    check_cookie_cart
    @products[product_id] = quantity
    update_cookie_cart @products
  end

  def list_product product_cart
    @products = Product.find_product_by_id product_cart.keys
    @products.each do |p|
      p.total_quantity = product_cart[p.id.to_s].to_i
    end
  end

  def delete_product_cart product_id
    check_cookie_cart
    @products.delete product_id
    update_cookie_cart @products
  end
end
