class Sku < ApplicationRecord
  belongs_to :product
  has_many :cart_skus, dependent: :destroy
  validates :sku, :inventory, :price, presence: true
end
