module ErrorsHelper

  def check_errors_class(obj)
    return unless obj.errors.any?
    obj.class.name.downcase
  end

  def check_errors_messages(obj)
    return if obj.errors.full_messages.nil?

    html_values = ""
    obj.errors.full_messages.each do |msg|
      html_values << (content_tag :li, msg)
    end
    html_values.html_safe

  end

end
