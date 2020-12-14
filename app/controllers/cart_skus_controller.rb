class CartSkusController < ApplicationController
  def create
    @cart_sku = CartSku.where(["cart_id = ? and sku_id = ?", @cart.id, params[:cart_sku][:sku_id]])
    if @cart_sku.blank?
      @cart_sku = CartSku.new(cart_sku_params)
      @cart_sku.cart = @cart
      @cart_sku.save
      redirect_to root_path
    end
  end

  def destroy
    @cart_sku = CartSku.find(params[:id])
    @cart_sku.destroy
    redirect_to root_path
  end
  
  private

  def cart_sku_params
    params.require(:cart_sku).permit(:amount, :sku_id)
  end
end