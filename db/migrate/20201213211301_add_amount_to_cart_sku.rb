class AddAmountToCartSku < ActiveRecord::Migration[6.0]
  def change
    add_column :cart_skus, :amount, :integer
  end
end
