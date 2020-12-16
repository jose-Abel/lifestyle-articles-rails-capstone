module ArticleHelper
  def render_most_popular(articles)
    popular = Vote.popular.first

    if popular
      Article.find_by(id: popular.article_id)
    else
      articles[0]
    end
  end

  def render_without_popular(articles)
    popular = Vote.popular.first

    if popular
      articles.reject do |x|
        x.id == popular.article_id
      end
    else
      articles.reject do |x|
        x.id == articles[0].id
      end
    end
  end

  def render_picture(article)
    article.image.url
  end
end
