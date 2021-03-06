# rubocop : disable Layout/LineLength

require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'john')

    @pic = File.open('test/fixtures/files/ford-mustang-1970.jpg')

    @article = Article.create(title: 'Testing article', text: 'An article to test Article model functionalities', author_id: @user.id, image: @pic)

    @vote = Vote.new(user_id: @user.id, article_id: @article.id)
  end

  test 'vote should be valid' do
    assert @vote.valid?
  end

  test 'vote should be unique for article and user' do
    @vote.save
    @vote2 = Vote.new(user_id: @user.id, article_id: @article.id)
    assert_not @vote2.valid?
  end
end

# rubocop : enable Layout/LineLength
