class Cart < ApplicationRecord
  has_many :cart_skus
  has_many :skus, through: :cart_skus
  has_many :products, through: :skus
end
