require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: 'johndoe')
  end

  test "get session new view and log's user in" do
    get '/login'
    assert_response :success

    post login_path, params: { session: { username: @user.username } }
    assert_response :redirect

    follow_redirect!
    assert_response :success
    assert_match 'Logged in successfully', response.body
  end
end
