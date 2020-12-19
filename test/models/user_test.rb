require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'john')
  end

  test 'user should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'name should be unique' do
    @user.save
    @user2 = User.new(name: 'john')
    assert_not @user2.valid?
  end

  test 'name should not be too long' do
    @user.name = 'a' * 11
    assert_not @user.valid?
  end

  test 'name should not be to short' do
    @user.name = 'bb'
    assert_not @user.valid?
  end
end
