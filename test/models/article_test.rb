require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "john")
    @article = Article.new(title: "test article", text: "testing article model", image: "link of the image", user: @user)
  end

  test "article should be valid" do
    assert @article.valid?
  end

  test "title should be present" do
    @article.title = ""
    assert_not @article.valid?
  end

  test "title should not be too long" do
    @article.title = "a" * 101
    assert_not @article.valid?
  end

  test "title should not be to short" do
    @article.title = "b" * 5
    assert_not @article.valid?
  end

  test "text should be present" do
    @article.text = " "
    assert_not @article.valid?
  end

  test "text should not be too long" do
    @article.text = "a" * 10001
    assert_not @article.valid?
  end

  test "text should not be to short" do
    @article.text = "b" * 9
    assert_not @article.valid?
  end
end