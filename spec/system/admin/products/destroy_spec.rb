require "rails_helper"

describe "Admin::Products#destroy" do
  let!(:product) { create(:product) }

  it "redirects to admin/products page" do
    visit url_for([ :admin, product, only_path: true ])

    click_on "Destroy"

    expect(page).not_to have_content(product.title)
    expect(page.current_path).to eq(url_for([ :admin, :products, only_path: true ]))
  end
end
