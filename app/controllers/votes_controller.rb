class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(article_id: params[:article_id])

    if @vote.save
      redirect_to root_path, notice: 'You vote a post.'
    else
      redirect_to root_path, alert: 'You cannot vote this post.'
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
    if vote
      vote.destroy
      redirect_to root_path, notice: 'You unvoted a post.'
    else
      redirect_to root_path, alert: 'You cannot unvote post that you did not vote before.'
    end
  end
end