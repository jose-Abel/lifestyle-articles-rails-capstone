# rubocop : disable Layout/LineLength

require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(name: 'johndoe')

    @pic = File.open('test/fixtures/files/ford-mustang-1970.jpg')

    @article = Article.create(title: 'Testing article', text: 'An article to test Article model functionalities', author_id: @user.id, image: @pic)
  end

  test 'should get new' do
    sign_in(@user)
    get new_article_url
    assert_response :success
  end

  test 'should get edit' do
    sign_in(@user)
    get edit_article_url(@article)
    assert_response :success
  end

  test 'should update article' do
    sign_in(@user)
    patch article_url(@article), params: { article: { title: 'Changing title', text: 'Testing functionality of writing an article', image: @pic, category_ids: [] } }
    assert_response :success
  end

  test 'should destroy article' do
    sign_in(@user)
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end

    assert_redirected_to root_url
  end
end

# rubocop : enable Layout/LineLength
