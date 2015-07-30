require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
	test "can get about page" do 
		# assert_equal 2, 1 + 1
		get :about
		assert_response :success
		assert_select "title", "Hello, Ruby"
		assert_select "h1", "About US"
	end

end