require "rails_helper"
require "spec_helper"

RSpec.describe Category, type: :model do
  describe "associations" do
    it "has many products" do
      is_expected.to have_many(:products).dependent :destroy
    end

    it "has many child categories" do
      is_expected.to have_many(:child_categories).dependent :destroy
    end
  end
end
