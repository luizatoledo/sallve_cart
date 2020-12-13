class Product < ApplicationRecord
  has_many_attached :photos
  has_one :sku
  validates :name, presence: true
end
