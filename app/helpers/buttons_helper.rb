module ButtonsHelper
  def button_show(text, url, options = {})
    options.merge!(class: "button is-default")

    link_to text, url, options
  end

  def button_back(text, url, options = {})
    options.merge!(class: "button is-secondary")

    link_to text, url, options
  end

  def button_new(text, url, options = {})
    options.merge!(class: "button is-primary")

    link_to text, url, options
  end

  def button_edit(text, url, options = {})
    options.merge!(class: "button is-warning")

    link_to text, url, options
  end

  def button_delete(text, url, options = {})
    options.merge!(
      class: "button is-danger",
      data: {
        "turbo-method": :delete,
        "turbo-confirm": "Are you sure?"
      }
    )

    link_to text, url, options
  end
end
