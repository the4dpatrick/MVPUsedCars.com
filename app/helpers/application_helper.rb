module ApplicationHelper
  # Add `active` class if current page
  def nav_link(link_text, link_path)
    if current_page?(link_path) || link_path != '/' && request.fullpath[0..(link_path.size - 1)] == link_path
      class_name = 'active'
    else
      class_name = nil
    end

    content_tag(:li, class: class_name) do
      link_to link_text, link_path
    end
  end
end
