module ArticleHelper

  def render_without_popular(articles)
    return if articles.nil?

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

  def check_picture(article, custom_class)
    return unless article
    image_tag(article.image_url, class: custom_class)
  end

  def check_name(article)
    return unless article
    article.user.name
  end

  def check_article(article, attribute, class_name=false)
    return if article.nil?

    if article
      if attribute == 'title'
        link_to(article.title, article_path(article), class: class_name)

      elsif attribute == 'text'
        return article.text
  
      elsif attribute == 'created'
        return article.created_at

      elsif attribute == 'updated'
        return article.updated_at
      end
    end
  end

  def check_categories(article)
    return unless article.categories.any?
    priority = 0
    most_important_category = ''
    
    article.categories.each do |category|
      if category.priority > priority
        priority = category.priority
        most_important_category = category
      end
    end
    most_important_category
  end
end
