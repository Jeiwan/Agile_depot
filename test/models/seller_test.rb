require 'test_helper'

class SellerTest < ActiveSupport::TestCase
	test "should not pass name validation" do
		seller = Seller.new email: 'pedro@gmail.com', password: '123456', password_confirmation: '123456'
		assert_not seller.save
	end
	test "should not pass email validation" do
		seller = Seller.new name: 'Seller', password: '123456', password_confirmation: '123456'
		assert_not seller.save
		# seller = Seller.new name: 'Seller', email: 'woot', password: '123456', password_confirmation: '123456'
		# assert_not seller.save
		seller = Seller.new name: 'Seller', email: 'me@jeiwan.ru', password: '123456', password_confirmation: '123456'
		assert_not seller.save
		seller = Seller.new name: 'Seller', email: 'pedro@pedro.ru'
		assert_not seller.save
	end
	test "should not pass password validation" do
		seller = Seller.new name: 'Seller', email: 'pedro@pedro.ru'
		assert_not seller.save
		seller = Seller.new name: 'Seller', email: 'pedro@pedro.ru', password: '1'
		assert_not seller.save
		seller = Seller.new name: 'Seller', email: 'pedro@pedro.ru', password: '123456'
		assert_not seller.save
		seller = Seller.new name: 'Seller', email: 'pedro@pedro.ru', password: '123456', password_confirmation: '654321'
		assert_not seller.save
		seller = Seller.new name: 'Seller', email: 'pedro@pedro.ru', password: '123456', password_confirmation: '654321'
		assert_not seller.save
	end
end
