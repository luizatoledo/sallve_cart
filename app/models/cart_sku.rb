class CartSku < ApplicationRecord
  belongs_to :sku
  belongs_to :cart
end
