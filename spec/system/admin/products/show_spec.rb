require "rails_helper"

describe "Admin::Products#show" do
  let!(:product) { create(:product) }

  it "renders products list" do
    visit url_for([ :admin, product, only_path: true ])

    expect(page).to have_content(product.title)
    expect(page).to have_content(product.description)
    expect(page).to have_content(product.price)
  end
end
