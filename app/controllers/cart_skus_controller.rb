class CartSkusController < ApplicationController
  def create
    @cart_sku = CartSku.new(cart_sku_params)
    @cart_sku.cart = @cart
    @cart_sku.save
  end

  def destroy
    @cart_sku = CartSku.find(params[:id])
    redirect_to root_path
  end
  private

  def cart_sku_params
    params.require(:cart_sku).permit(:amount, :sku_id)
  end
end