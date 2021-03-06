# rubocop : disable Layout/LineLength

# rubocop : disable Metrics/CyclomaticComplexity

module ArticleHelper
  def render_without_popular(articles)
    return if articles.nil?

    if @popular
      articles.reject do |x|
        x.id == @popular.article_id
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

  def check_article(article, attribute, class_name = nil)
    return if article.nil?

    case attribute
    when 'title'
      link_to(article.title, article_path(article), class: class_name)

    when 'text'
      article.text

    when 'created'
      article.created_at

    when 'updated'
      article.updated_at
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

  def view_edit_delete_links(article, path)
    return unless article

    if path == 'view'
      link_to('Read more', article_path(article), class: 'btn btn-outline-warning')

    elsif logged_in? and article.user == current_user
      case path
      when 'edit'
        link_to('Edit', edit_article_path(article), class: 'btn btn-outline-info')
      when 'delete'
        link_to('Delete', article_path(article), class: 'btn btn-outline-danger', method: :delete, data: { confirm: 'Are you sure?' })
      end
    end
  end
end

# rubocop : enable Metrics/CyclomaticComplexity

# rubocop : enable Layout/LineLength
