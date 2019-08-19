require "spec_helper"

RSpec.describe "admin/products/new.html.erb", type: :view do
  let(:product) {FactoryBot.build :product}
  let(:categories) {Category.all}
  subject {rendered}

  before do
    assign :product, product
    assign :categories, categories
    render
  end

  it {is_expected.to have_content I18n.t("admin.products.new.title")}

  describe "form" do
    it {assert_select "form[action*=?]", products_path}

    it {is_expected.to have_field "product_name"}

    it {is_expected.to have_field "product_description"}

    it {is_expected.to have_field "product_detail"}

    it {is_expected.to have_field "product_picture"}

    it {is_expected.to have_field "product_price"}

    it {is_expected.to have_field "product_category_id"}

    it {is_expected.to have_selector "input", class: "btn btn-primary"}

    it {is_expected.to render_template(partial: "_form")}
  end
end
