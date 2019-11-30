require "rails_helper"
require "helpers/spec_test_helper"

RSpec.describe Admin::ProductsController, type: :controller do
  include SpecTestHelper

  let(:category){FactoryBot.create :category}
  let(:product){FactoryBot.create :product, category_id: category.id}
  let(:admin){FactoryBot.create :admin}
  let(:guess){FactoryBot.create :user}
  let(:invalid_params){{name: ""}}

  describe "before action" do
    it {is_expected.to use_before_action :logged_in_user}
    it {is_expected.to use_before_action :admin_user}
    it {is_expected.to use_before_action :load_product}
    it {is_expected.to use_before_action :load_categories}
    it {is_expected.to use_before_action :set_locale}
  end

  describe "GET #index" do
    context "when user not login" do
      before {get :index}

      it{expect(response).to redirect_to login_url}
    end

    context "when user guess login" do
      before do
        log_in guess
        get :index
      end
      it{expect(response).to redirect_to root_path}
    end

    context "when user admin login" do
      before do
        log_in admin
        get :index
      end
      it{expect(response).to render_template :index}
    end
  end

  describe "GET #new" do
    context "when user not login" do
      before{get :new}
      it{expect(response).to redirect_to login_path}
    end

    context "when user guess login" do
      before do
        log_in guess
        get :new
      end

      it{expect(response).to redirect_to root_path}
    end

    context "when user admin login" do
      before do
        log_in admin
        get :new
      end

      it{expect(response).to render_template :new}
    end
  end

  describe "POST #create" do
    before {log_in admin}

    context "when valid attributes" do
      it do
        post :create, params: {product: FactoryBot.attributes_for(:product)}
        expect(assigns(:product)).to be_a Product
      end
    end

    context "when invalid atrributes" do
      it do
        post :create, params: {product: invalid_params}
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    context "when user not login" do
      before{get :edit, params:{id: product.id}}
      it{expect(response).to redirect_to login_path}
    end

    context "when user guess login" do
      before do
        log_in guess
        get :new
      end

      it{expect(response).to redirect_to root_path}
    end

    context "when user admin login" do
      before do
        log_in admin
        get :edit, params: {id: product.id}
      end

      it{expect(response).to render_template :edit}
    end
  end

  describe "PUT update" do
    before {log_in admin}

    context "valid attributes" do
      it do
        put :update, params: {product: FactoryBot.attributes_for(:product), id: product.id}
        expect(assigns(:product)).to be_a Product
      end
    end

    context "invalid attributes" do
      it do
        put :update, params: {product: invalid_params, id: product.id}
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE destroy" do
    before{log_in admin}

    context "when admin delete success" do
      it do
        delete :destroy, params: {id: product.id}
        expect(response).to redirect_to admin_products_path
      end
    end
  end
end
