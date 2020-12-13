class CreateSkus < ActiveRecord::Migration[6.0]
  def change
    create_table :skus do |t|
      t.integer :sku
      t.integer :inventory
      t.float :price
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
