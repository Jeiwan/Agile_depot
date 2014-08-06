require 'test_helper'

class SellersControllerTest < ActionController::TestCase

	test "should not show index" do
		get :index
		assert_redirected_to root_path
	end

	test "should show index" do
		session[:user_id] = sellers(:jeiwan).id
		get :index
		assert_response :success
		assert_equal assigns(:products).count, 2
	end

	test "should show new" do
		get :new
		assert_response :success
	end

	test "should create new seller" do
		assert_difference 'Seller.count' do
			seller = {name: 'Pedro', email: 'me@pedro.com', password: 'asdzxc', password_confirmation: 'asdzxc'}
			post :create, {seller: seller}
		end
	end

end
