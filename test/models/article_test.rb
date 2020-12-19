# rubocop : disable Layout/LineLength

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'john')

    @pic = File.open('test/fixtures/files/ford-mustang-1970.jpg')

    @article = Article.create(title: 'Testing article', text: 'An article to test Article model functionalities', author_id: @user.id, image: @pic)
  end

  test 'article should be valid' do
    assert @article.valid?
  end

  test 'title should be present' do
    @article.title = ''
    assert_not @article.valid?
  end

  test 'title should not be too long' do
    @article.title = 'a' * 101
    assert_not @article.valid?
  end

  test 'title should not be to short' do
    @article.title = 'b' * 5
    assert_not @article.valid?
  end

  test 'text should be present' do
    @article.text = ' '
    assert_not @article.valid?
  end

  test 'text should not be too long' do
    @article.text = 'a' * 10_001
    assert_not @article.valid?
  end

  test 'text should not be to short' do
    @article.text = 'b' * 9
    assert_not @article.valid?
  end
end

# rubocop : enable Layout/LineLength
