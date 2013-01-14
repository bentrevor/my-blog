module ApplicationHelper
  # interpret entry content as markdown using Redcarpet
  def markdown(text)
    Redcarpet.new(text).to_html.html_safe
  end
end
