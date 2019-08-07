require "rails_helper"
require "spec_helper"

RSpec.describe DetailOrder, type: :model do
  describe "associations" do
    it "belongs to order" do
      is_expected.to belong_to(:order)
    end

    it "belongs to product" do
      is_expected.to belong_to(:product)
    end
  end
end
