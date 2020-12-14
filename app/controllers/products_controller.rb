class ProductsController < ApplicationController
  def index
    @products = Product.all
    @cart_sku = CartSku.new
  end
end
