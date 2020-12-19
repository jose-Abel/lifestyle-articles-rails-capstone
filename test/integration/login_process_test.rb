require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(name: 'johndoe')
  end

  test "get session new view and log's user in" do
    get '/login'
    assert_response :success

    post login_path, params: { session: { name: @user.name } }
    assert_response :redirect

    follow_redirect!
    assert_response :success
    assert_match 'Logged in successfully Johndoe', response.body
  end
end
