class CartsController < ApplicationController
  def show
    @cart_skus = @cart.cart_skus

  end

  def destroy
  end
end
