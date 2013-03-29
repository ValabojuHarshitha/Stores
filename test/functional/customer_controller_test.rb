require 'test_helper'

class CustomerControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get listing" do
    get :listing
    assert_response :success
  end

end
