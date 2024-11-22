require "rails_helper"

describe "Admin::Products#index" do
  let!(:products) { create_list(:product, 2) }

  it "renders products list" do
    visit url_for([ :admin, :products, only_path: true ])

    products.each do |product|
      expect(page).to have_content(product.title)
    end
  end
end
