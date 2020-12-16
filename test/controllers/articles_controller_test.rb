require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: 'johndoe')

    @article = Article.create(title: 'Testing article', text: 'Testing functionality of writing an article', user: @user)
  end

  test 'should get new' do
    sign_in(@user)
    get new_article_url
    assert_response :success
  end

  test 'should create a new article' do
    sign_in(@user)
    assert_difference('Article.count', 1) do
      post articles_url, params: { article: { title: 'Testing article', text: 'Testing functionality of writing an article', image: PictureUploader.new, category_ids: [] } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test 'should not get to create article if not sign_in' do
    assert_no_difference('Article.count') do
      post articles_url, params: { article: { title: 'Testing article', text: 'Testing functionality of writing an article', image: PictureUploader.new, category_ids: [] } }
    end

    assert_redirected_to login_path
  end

  test 'should show article' do
    get article_url(@article)
    assert_response :success
  end

  test 'should get edit' do
    sign_in(@user)
    get edit_article_url(@article)
    assert_response :success
  end

  test 'should update article' do
    sign_in(@user)
    patch article_url(@article), params: { article: { title: 'Changing title', text: 'Testing functionality of writing an article', image: PictureUploader.new, category_ids: [] } }
    assert_redirected_to article_url(@article)
  end

  test 'should destroy article' do
    sign_in(@user)
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end

    assert_redirected_to root_url
  end
end
