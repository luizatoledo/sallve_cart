class ProductsController < ApplicationController
  def index
    @products = Product.all
    @cart = current_cart
  end

  private

  def products_in_cart
    @cart = current_cart
    products_info =  @cart.products.map do |product|
      {sku: product.sku.sku}
    end 
  end
end
