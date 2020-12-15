class Product < ApplicationRecord
  has_one_attached :photo
  has_one :sku, dependent: :destroy
  validates :name, presence: true
end
