class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :destroy]

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)
  end

  def show
  end

  def destroy
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.require(:cart)
  end
end
