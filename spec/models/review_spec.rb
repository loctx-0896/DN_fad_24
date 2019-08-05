require "rails_helper"
require "spec_helper"

RSpec.describe Review, type: :model do
  describe "associations" do
    it "belongs to product" do
      is_expected.to belong_to(:product)
    end
    it "belongs to user" do
      is_expected.to belong_to(:user)
    end
  end
end
