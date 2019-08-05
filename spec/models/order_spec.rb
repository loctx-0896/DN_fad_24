require "rails_helper"
require "spec_helper"

RSpec.describe Order, type: :model do
  describe "associations" do
    it "has many detail orders" do
      is_expected.to have_many(:detail_orders).dependent :destroy
    end
    it "belongs to user" do
      is_expected.to belong_to(:user)
    end
  end
  describe "is name" do
    it {is_expected.to validate_presence_of :name}
  end

  describe "is phone" do
    it {is_expected.to validate_presence_of :phone}
  end

  describe "is address" do
    it {is_expected.to validate_presence_of :address}
  end
end
