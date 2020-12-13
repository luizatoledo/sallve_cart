class CreateCartSkus < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_skus do |t|
      t.references :sku, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
