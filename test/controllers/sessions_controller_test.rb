require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new login" do
    get login_path
    assert_response :success
  end

  test "should get new user registration" do
    get new_user_path
    assert_response :success
  end
end
