require 'test_helper'

class CartSkusControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get cart_skus_create_url
    assert_response :success
  end

end
