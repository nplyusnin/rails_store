require "rails_helper"

describe "Admin::Update#create" do
  let!(:product) { create(:product) }

  context "with valid params" do
    let(:attributes) { attributes_for(:product) }

    before { visit edit_admin_product_path(product) }

    it "update the product, shows alert, redirect to updated product" do
      fill_in "Title", with: attributes[:title]
      fill_in "Description", with: attributes[:description]
      fill_in "Price", with: attributes[:price]

      click_on "Update Product"

      expect(page).to have_content(attributes[:title])
      expect(page).to have_content("Product was successfully updated.")

      expect(page.current_path).to eq(admin_product_path(product))
    end
  end

  context "with invalid params" do
    let(:attributes) { attributes_for(:product, title: " ") }

    before { visit edit_admin_product_path(product) }

    it "renders errors" do
      fill_in "Title", with: attributes[:title]
      fill_in "Description", with: attributes[:description]
      fill_in "Price", with: attributes[:price]

      click_on "Update Product"

      expect(page).to have_content("can't be blank")
    end
  end
end
