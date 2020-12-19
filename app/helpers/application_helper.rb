module ApplicationHelper

  def home_write_links(path)
    return unless logged_in?
    if path == "home"
      link_to('Home', root_path, class: "nav-link")

    elsif path == "article"
      link_to('Write an Article', new_article_path, class: "nav-link")
    end
  end

  def log_status_link(path)
    if logged_in?
      if path == "logout"
        link_to('Log out', logout_path, class: "my-2 my-sm-0 logout links mr-2", method: :delete)
      end
    else
      if path == "login"
        link_to('Log in', login_path, class: "my-2 my-sm-0 login links mr-2")

      elsif path == "signup"
        link_to('Sign up', new_user_path, class: "my-2 my-sm-0 signup links mr-2")
      end
    end
  end

  def view_edit_delete_links(article, path)
    return unless article

    if path == 'view'
      link_to('View', article_path(article), class: "btn btn-outline-success")
    end

    if logged_in?
      if article.user == current_user
        if path == "edit"
          link_to('Edit', edit_article_path(article), class: "btn btn-outline-info")
        elsif path == "delete"
          link_to('Delete', article_path(article), class: "btn btn-outline-danger", method: :delete, data: {confirm: "Are you sure?"})
        end
      end
    end
  end

  def vote_or_unvote_btn(article)
    return unless logged_in?

    content_tag(:div, :class => 'btn btn-outline-secondary') do
    vote = Vote.find_by(article: article, user: current_user)
      if vote
        link_to('Unvote', article_vote_path(id: vote.id, article_id: article.id), method: :delete)
      else
        link_to('Vote', article_votes_path(article_id: article.id), method: :post)
      end
    end
  end
end
