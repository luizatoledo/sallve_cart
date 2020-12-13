class ApplicationController < ActionController::Base
  # action to create a persistent cart using sessions cookies
  def current_cart
    if session[:cart]
      @cart = Cart.find(session[:cart])
    else
      @cart = Cart.create
      session[:cart] = @cart.id
    end
  end
end
