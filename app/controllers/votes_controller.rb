class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(article_id: params[:article_id])
    article = Article.find_by(id: @vote.article_id)

    if @vote.save
      flash[:notice] = 'You vote an article.'
      redirect_to article_path(article)

    else
      flash[:alert] = 'You cannot vote this article.'
      redirect_to article_path(article)
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[:article_id])

    article = Article.find_by(id: vote.article_id)

    if vote
      vote.destroy
      flash[:notice] = 'You unvoted an article.'
      redirect_to article_path(article)
    else
      flash[:alert] = 'You cannot unvote an article that you did not vote before.'
      redirect_to article_path(article)
    end
  end
end
