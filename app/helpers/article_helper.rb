module ArticleHelper

  def render_most_popular(articles)
    popular = Vote.popular.first
    
    if popular
      return Article.find_by(id: popular.article_id)
    else
      return articles[0]
    end
  end

  def render_without_popular(articles)
    popular = Vote.popular.first

    if popular
      articles = articles.reject { |x|
        x.id == popular.article_id }
    else
      articles = articles.reject { |x|
        x.id == articles[0].id }
    end
    articles
  end

  def render_picture(article)
    if article.image?
      return article.image.url
    else
      return "ford-mustang-1970.jpg"
    end
  end
end