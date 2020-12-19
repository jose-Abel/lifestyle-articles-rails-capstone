require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: 'Sports', priority: 3)
  end

  test 'category should be valid' do
    assert @category.valid?
  end

  test 'name should be present' do
    @category.name = ''
    assert_not @category.valid?
  end

  test 'name should not be too long' do
    @category.name = 'a' * 21
    assert_not @category.valid?
  end

  test 'name should not be to short' do
    @category.name = 'bb'
    assert_not @category.valid?
  end
end
