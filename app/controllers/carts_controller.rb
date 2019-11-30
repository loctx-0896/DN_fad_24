class CartsController < ApplicationController
  def index
    list_product check_cookie_cart
  end

  def create
    add_product params[:product_id]
    render json: {size_cart: size_cart}
  end

  def update
    product_id = params[:product_id]
    quantity = params[:quantity]
    update_quantity_product(product_id, quantity)
    list_product check_cookie_cart
    product = Product.find_by id: product_id
    render json: {
      total_quantity: quantity,
      price: product.price,
      total_cart: total_cart
    }
  end

  def destroy
    product_id = params[:id]
    delete_product_cart product_id
    redirect_to request.referer
  end
end
