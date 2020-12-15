module ArticleHelper

  def render_most_popular(articles)
    popular = Vote.popular
    articles.each do |article|
      return article if article == popular
    end
    articles[0]
  end

  def render_without_popular(articles)
    popular = Vote.popular

    if popular.length == 0
      articles = articles.reject { |x|
        x.id == articles[0].id }
    else
      articles = articles.reject { |x|
        x.id == popular.article_id }
    end

    articles
  end
end