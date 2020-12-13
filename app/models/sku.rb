class Sku < ApplicationRecord
  belongs_to :product
  has_many :cart_skus
  validates :sku, :inventory, :price, presence: true
end
