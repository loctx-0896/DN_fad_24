class ProductsDetailController < ApplicationController
  def show
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = t ".not_found_product"
    redirect_to root_path
  end
end
