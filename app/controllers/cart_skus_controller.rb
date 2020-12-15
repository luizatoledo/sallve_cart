class CartSkusController < ApplicationController
  def create
    # first try to find a cart_sku with the current cart id and the sku id
    @cart_sku = CartSku.where(["cart_id = ? and sku_id = ?", @cart.id, params[:cart_sku][:sku_id]])
    # if cannot find cart_sku, creates a new one
    if @cart_sku.blank?
      @cart_sku = CartSku.new(cart_sku_params)
      if @cart_sku.sku.inventory > 0
        @cart_sku.cart = @cart
        @cart_sku.save
        new_inventory = @cart_sku.sku.inventory - 1
        @cart_sku.sku.update(inventory: new_inventory)
        redirect_to root_path
      end
    end
  end

  def update
    @cart_sku = CartSku.find(params[:id])
    @cart_sku.update(amount: params[:amount])
    render json: {items_price: @cart_sku.total_price, cart_price: @cart_sku.cart.total_price, cart_amount: @cart_sku.cart.total_amount}
  end

  def destroy
    @cart_sku = CartSku.find(params[:id])
    @cart_sku.destroy
    url = request.base_url + root_path
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render json: {delete: 'deleted', redirect: url } }
    end
  end
  
  private

  def cart_sku_params
    params.require(:cart_sku).permit(:amount, :sku_id)
  end

  def new_amount
    
  end

end