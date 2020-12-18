module ArticleHelper

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
    articles
  end

  def check_picture(article)
    return if article.image_url.nil?
    article.image_url
  end

  def check_username(article)
    return if article.user.nil?
    article.user.username
  end

  def check_categories(article)
    return unless article.categories.any?
    article.categories
  end
  
end
