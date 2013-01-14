module ApplicationHelper
  # interpret entry content as markdown using Redcarpet
  def markdown(text)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(text).html_safe
  end
end
