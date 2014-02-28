require 'test_helper'

class MynotesControllerTest < ActionController::TestCase
  test "should get auth" do
    get :auth
    assert_response :success
  end

  test "should get notes" do
    get :notes
    assert_response :success
  end

end
