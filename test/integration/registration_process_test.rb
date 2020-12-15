require 'test_helper'

class RegistrationTest < ActionDispatch::IntegrationTest
  test "get users new view and register's user in" do
    get "/users/new"
    assert_response :success

    post users_path, params: { user: { username: "testing" } }
    assert_response :redirect

    follow_redirect!
    assert_response :success
    assert_match "Welcome testing to the LifeStyle Articles", response.body
  end
end