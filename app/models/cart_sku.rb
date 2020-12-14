class CartSku < ApplicationRecord
  belongs_to :sku
  belongs_to :cart

  def total_price
    '%.2f' % (self.amount * self.sku.price)
  end
end
