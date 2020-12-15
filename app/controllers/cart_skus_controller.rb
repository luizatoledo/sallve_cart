class CartSkusController < ApplicationController
  def create
    # first try to find a cart_sku with the current cart id and the sku id
    @cart_sku = CartSku.where(["cart_id = ? and sku_id = ?", @cart.id, params[:cart_sku][:sku_id]])
    # if cannot find cart_sku, creates a new one
    if @cart_sku.blank?
      @cart_sku = CartSku.new(cart_sku_params)
      # should only be able to add a product that has inventory
      if @cart_sku.sku.inventory > 0
        @cart_sku.cart = @cart
        @cart_sku.save
        # on adding the sku for the first time to cart, the inventory decreases by 1
        update_inventory(@cart_sku.sku, 1)
        redirect_to root_path
      else
        flash[:alert] = "ops! esse produto está esgotado... em breve teremos mais para você"
        redirect_to root_path
      end

    end
  end

  def update
    @cart_sku = CartSku.find(params[:id])
    # should only be able to add to cart an amount that is lesser or equal then the inventory
    if params[:amount].to_i <= @cart_sku.sku.inventory
      # subtract from inventory if client added to cart
      if @cart_sku.amount < params[:amount].to_i
        update_inventory(@cart_sku.sku, params[:amount].to_i)
      # add to inventory if client removed from cart
      elsif @cart_sku.amount > params[:amount].to_i
        update_inventory(@cart_sku.sku, -params[:amount].to_i)
      end
      @cart_sku.update(amount: params[:amount].to_i)
    else
      flash[:alert] = "ops! você já selecionou todo nosso estoque"
    end
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
    params.require(:cart_sku).permit(:amount, :sku_id, :cart_id)
  end

  def update_inventory(sku, reduction)
    new_inventory = sku.inventory - reduction
    sku.update(inventory: new_inventory)
  end

end