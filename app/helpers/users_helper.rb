module UsersHelper
  def sidebar_active_link_to(link_path)
    if current_page?(link_path) || request.fullpath[0..(link_path.size - 1)] == link_path
      class_name = 'active'
    else
      class_name = nil
    end

    content_tag(:li, class: class_name) do
      link_to(link_path) do
        yield if block_given?
      end
    end
  end
end
