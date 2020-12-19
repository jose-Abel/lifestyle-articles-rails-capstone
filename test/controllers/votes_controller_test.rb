# rubocop : disable Layout/LineLength

require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(name: 'johndoe')

    @pic = File.open('test/fixtures/files/ford-mustang-1970.jpg')

    @article = Article.create(title: 'Testing article', text: 'An article to test Article model functionalities', author_id: @user.id, image: @pic)

    @vote = Vote.new(user_id: @user.id, article_id: @article.id)

    sign_in(@user)
  end

  test 'should create a new vote' do
    assert_difference('Vote.count', 1) do
      post article_votes_url(@article)
    end

    assert_redirected_to article_url(@article)
  end

  test 'should destroy vote' do
    @vote.save
    assert_difference('Vote.count', -1) do
      delete article_vote_url(@article, @vote)
    end

    assert_redirected_to article_url(@article)
  end
end

# rubocop : enable Layout/LineLength
