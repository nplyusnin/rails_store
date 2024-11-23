require "rails_helper"

describe "Products#show" do
  let!(:product) { create(:product) }

  it "renders product details" do
    visit product_path(product)

    expect(page).to have_content(product.title)
    expect(page).to have_content(product.description)
    expect(page).to have_content(product.price)
  end
end
