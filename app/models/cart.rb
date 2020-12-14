class Cart < ApplicationRecord
  has_many :cart_skus, dependent: :destroy
  has_many :skus, through: :cart_skus
  has_many :products, through: :skus

  def total_amount
    total = 0
    self.cart_skus.each {|sku| total += sku.amount}
    total
  end

  def total_price
    total = 0
    self.cart_skus.each {|sku| total += sku.total_price.to_f}
    '%.2f' % total
  end
end
