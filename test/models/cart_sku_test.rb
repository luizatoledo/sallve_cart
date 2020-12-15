require 'test_helper'

class CartSkuTest < ActiveSupport::TestCase
  test "total_price returns price * amount of 1 sku" do
    cart = Cart.new
    prod = Product.new(name: 'sérum antiacne')
    sku = Sku.new(sku: 1, inventory: 10, price: 59.9 )
    sku.product = prod
    cart_sku = CartSku.new(amount: 8)
    cart_sku.cart = cart
    cart_sku.sku = sku
    result = '%.2f' % (sku.price * cart_sku.amount)
    assert_equal result, cart_sku.total_price
  end
end
