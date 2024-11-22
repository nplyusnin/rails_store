module TypographyHelper
  def page_header(text)
    content_tag :h1, class: "title" do
      text
    end
  end
end
