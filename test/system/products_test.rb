require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    # only works if HTTP returns 200
    visit root_path
    # having the root path work, it should have an h2 with a product name
    assert_selector "h2", text: "sérum antiacne"
    # the number of classes product-card should be equal to the number of products in DB
    assert_selector ".product-card", count: Product.count
  end
end
