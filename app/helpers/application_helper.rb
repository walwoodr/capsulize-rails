module ApplicationHelper

  def header(h2, h3 = "")
    content_for(:h2) do
      h2
    end
    content_for(:h3) do
      h3
    end
  end
end
