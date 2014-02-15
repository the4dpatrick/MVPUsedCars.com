module UsersHelper
  def sidebar_active_link_to(link_path)
    class_name = current_page?(link_path) && request.fullpath == link_path ? 'active' : nil

    content_tag(:li, class: class_name) do
      link_to(link_path) do
        yield if block_given?
      end
    end
  end
end
