require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "total_price returns the sum of price * amount of all skus in cart" do
    # test setup

    cart = Cart.create

    # Create a set of product, sku and cart_sku
    prod1 = Product.create(name: 'sérum antiacne')
    sku1 = Sku.new(sku: 1, inventory: 10, price: 59.9 )
    sku1.product = prod1
    sku1.save
    cart_sku1 = CartSku.new(amount: 8)
    cart_sku1.cart = cart
    cart_sku1.sku = sku1
    cart_sku1.save
    result = sku1.price * cart_sku1.amount
      
    # Create a second set of product, sku and cart_sku to sum 
    prod2 = Product.create(name: 'antioxidante hidratante')
    sku2 = Sku.new(sku: 2, inventory: 5, price: 89.9)
    sku2.product = prod2
    sku2.save
    cart_sku2 = CartSku.new(amount:2)
    cart_sku2.cart = cart
    cart_sku2.sku = sku2
    cart_sku2.save
    result += sku2.price * cart_sku2.amount

    # Create a third set of product, sku adn cart_sku to sum
    prod3 = Product.create(name: 'tônico renovador')
    sku3 = Sku.new(sku: 3, inventory: 2, price: 54.9)
    sku3.product = prod3
    sku3.save
    cart_sku3 = CartSku.new(amount:1)
    cart_sku3.cart = cart
    cart_sku3.sku = sku3
    cart_sku3.save
    result += sku3.price * cart_sku3.amount
  
    total = '%.2f' % result

    # test exercise and verify
    assert_equal total, cart.total_price

    # test teardown
    cart_sku1.destroy
    cart_sku2.destroy
    cart_sku2.destroy
    sku1.destroy
    sku2.destroy
    sku3.destroy
    prod1.destroy
    prod2.destroy
    prod3.destroy
    cart.destroy

  end

  test "total_amount returns the sum of amount of all skus in cart" do

    # test setup

    cart = Cart.create

    # Create a set of product, sku and cart_sku
    prod1 = Product.create(name: 'sérum antiacne')
    sku1 = Sku.new(sku: 1, inventory: 10, price: 59.9 )
    sku1.product = prod1
    sku1.save
    cart_sku1 = CartSku.new(amount: 8)
    cart_sku1.cart = cart
    cart_sku1.sku = sku1
    cart_sku1.save
    result = cart_sku1.amount
      
    # Create a second set of product, sku and cart_sku to sum 
    prod2 = Product.create(name: 'antioxidante hidratante')
    sku2 = Sku.new(sku: 2, inventory: 5, price: 89.9)
    sku2.product = prod2
    sku2.save
    cart_sku2 = CartSku.new(amount:2)
    cart_sku2.cart = cart
    cart_sku2.sku = sku2
    cart_sku2.save
    result += cart_sku2.amount

    # Create a third set of product, sku adn cart_sku to sum
    prod3 = Product.create(name: 'tônico renovador')
    sku3 = Sku.new(sku: 3, inventory: 2, price: 54.9)
    sku3.product = prod3
    sku3.save
    cart_sku3 = CartSku.new(amount:1)
    cart_sku3.cart = cart
    cart_sku3.sku = sku3
    cart_sku3.save
    result +=  cart_sku3.amount
  
    # test exercise and verify
    assert_equal result, cart.total_amount

    # test teardown
    cart_sku1.destroy
    cart_sku2.destroy
    cart_sku2.destroy
    sku1.destroy
    sku2.destroy
    sku3.destroy
    prod1.destroy
    prod2.destroy
    prod3.destroy
    cart.destroy

  end
end
