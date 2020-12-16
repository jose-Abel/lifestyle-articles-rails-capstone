require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create(name: 'Sports')
  end

  test 'should get show' do
    get category_url(@category)
    assert_response :success
  end
end
