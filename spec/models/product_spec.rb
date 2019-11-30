require "rails_helper"
require "spec_helper"

RSpec.describe Product, type: :model do
  describe "associations" do
    it "has many reviews" do
      is_expected.to have_many(:reviews).dependent :destroy
    end
    it "has many detail_orders" do
      is_expected.to have_many(:detail_orders)
    end
    it "belongs to category" do
      is_expected.to belong_to(:category)
    end
  end
end
