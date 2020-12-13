class Product < ApplicationRecord
  has_one_attached :photo
  has_one :sku
  validates :name, presence: true
end
