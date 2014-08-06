require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create session" do
  	post :create, email: 'me@jeiwan.ru', password: 'dfgcvb', password_confirmation: 'dfgcvb' 
  	assert_redirected_to dashboard_path
  end

  test "should destroy session" do
  	delete :destroy
  	assert_redirected_to dashboard_path
  end

end
