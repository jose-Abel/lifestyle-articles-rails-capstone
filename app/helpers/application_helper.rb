module ApplicationHelper
  def home_write_links(path)
    return unless logged_in?

    case path
    when 'home'
      link_to('Home', root_path, class: 'nav-link')

    when 'article'
      link_to('Write an Article', new_article_path, class: 'nav-link')
    end
  end

  def log_status_link(path)
    if logged_in?
      link_to('Log out', logout_path, class: 'my-2 my-sm-0 logout links mr-2', method: :delete) if path == 'logout'
    else
      case path
      when 'login'
        link_to('Log in', login_path, class: 'my-2 my-sm-0 login links mr-2')

      when 'signup'
        link_to('Sign up', new_user_path, class: 'my-2 my-sm-0 signup links mr-2')
      end
    end
  end

  def vote_or_unvote_btn(article)
    return unless logged_in?

    content_tag(:div, class: 'btn btn-outline-secondary') do
      vote = Vote.find_by(article: article, user: current_user)
      if vote
        link_to('Unvote', article_vote_path(id: vote.id, article_id: article.id), method: :delete)
      else
        link_to('Vote', article_votes_path(article_id: article.id), method: :post)
      end
    end
  end
end
