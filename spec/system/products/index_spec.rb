require "rails_helper"

describe "Products#index" do
  let!(:products) { create_list(:product, 2) }

  it "renders products list" do
    visit products_path

    products.each do |product|
      expect(page).to have_content(product.title)
    end
  end
end
