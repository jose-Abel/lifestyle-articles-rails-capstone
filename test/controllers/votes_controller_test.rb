require "test_helper"

class VotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: "johndoe")

    @article = Article.create(title: "Testing article", text: "Testing functionality of writing an article", user: @user)

    @vote = Vote.new(user_id: @user.id, article_id: @article.id)

    sign_in(@user)
  end

  test "should create a new vote" do
    assert_difference('Vote.count', 1) do
      post article_votes_url(@article)
    end

    assert_redirected_to root_url
  end

  test "should destroy vote" do
    @vote.save
    assert_difference('Vote.count', -1) do
      delete article_vote_url(@article, @vote)
    end

    assert_redirected_to root_url
  end

end