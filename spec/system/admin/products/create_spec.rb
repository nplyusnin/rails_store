require "rails_helper"

describe "Admin::Products#create" do
  context "with valid params" do
    let(:attributes) { attributes_for(:product) }

    before { visit "/admin/products/new" }

    it "creates new product, shows alert, redirect to created product" do
      fill_in "Title", with: attributes[:title]
      fill_in "Description", with: attributes[:description]
      fill_in "Price", with: attributes[:price]

      click_on "Create Product"

      expect(page).to have_content(attributes[:title])
      expect(page).to have_content("Product was successfully created.")
      expect(page.current_path).to eq(admin_product_path(Product.last))
    end
  end

  context "with invalid params" do
    let(:attributes) { attributes_for(:product, title: " ") }

    before { visit "/admin/products/new" }

    it "renders errors" do
      fill_in "Title", with: attributes[:title]
      fill_in "Description", with: attributes[:description]
      fill_in "Price", with: attributes[:price]

      click_on "Create Product"

      expect(page).to have_content("can't be blank")
    end
  end
end
