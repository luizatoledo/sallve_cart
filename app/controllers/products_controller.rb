class ProductsController < ApplicationController
  before_action :current_cart
  
  def index
    @products = Product.all
    @cart = current_cart
  end

  private

  # action to create a persistent cart using sessions cookies
  def current_cart
    if session[:cart]
      @cart = Cart.find(session[:cart])
    else
      @cart = Cart.create
      session[:cart] = @cart.id
    end
  end

  # def products_in_cart
  #   @cart = current_cart
  #   products_info =  @cart.products.map do |product|
  #     # {sku: product.sku.sku, amount: }
  #   end 
  # end
end
