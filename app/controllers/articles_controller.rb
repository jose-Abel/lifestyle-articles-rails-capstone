# rubocop : disable Style/GuardClause

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  before_action :require_user, except: %i[show index]

  before_action :require_same_user, only: %i[edit update destroy]

  def index
    @articles = Article.all
    article_id = Vote.popular.first.article_id

    if article_id
      @most_voted_article = Article.find_by(id: article_id)
    else
      @most_voted_article = @articles[0]
    end
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = 'Article was created successfully.'
      redirect_to @article
    else
      render new_article_path
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was updated successfully.'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      flash[:notice] = 'Article was deleted successfully.'
      redirect_to root_path
    else
      redirect_to @article
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :image, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user
      flash[:alert] = 'You can only edit or delete your own article'
      redirect_to @article
    end
  end
end

# rubocop : enable Style/GuardClause
