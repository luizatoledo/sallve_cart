class ProductsController < ApplicationController
  def index
    @products = Product.all
    # need a CartSku instance to fill form in index view
    @cart_sku = CartSku.new
  end
end
