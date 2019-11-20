module ApplicationHelper

    def render_svg(name, styles: "fill-current text-gray-400", title: nil)
      filename = "#{name}.svg"
      title ||= name.underscore.humanize
      inline_svg_tag(filename, aria: true, nocomment: true, title: title, class: styles)
    end

    def author_of(record)
      user_signed_in? && current_user.id == record.user_id
    end

      # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Helpolos.com"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
    
  end
