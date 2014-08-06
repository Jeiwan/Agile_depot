require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
	test "should get index" do
		get :index
		assert_response :success
		assert_equal assigns(:products).count, 2
	end

	test "should get show" do
		get :show, id: 1
		assert_response :success
		assert_not_nil assigns(:product)
		assert_equal assigns(:product).name, 'Banana'
	end

	test "should have seller" do
		assert_not_nil products(:one).seller
	end
end
