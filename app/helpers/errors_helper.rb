module ErrorsHelper

  def check_errors(obj)
    content_tag(:h4, "The following errors prevented the #{check_errors_class(obj)} from being saved", :class=>"alert-heading")
  end

  def check_errors_class(obj)
    obj.class.name.downcase
  end

  def check_errors_messages(obj)
    content_tag(:ul, :class => 'a class') do
      obj.errors.full_messages.each do |msg|
        concat content_tag(:li, msg)
      end
    end
  end

end
