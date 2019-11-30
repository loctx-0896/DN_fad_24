require "rails_helper"
require "spec_helper"

RSpec.describe Contact, type: :model do
  describe "associations" do
    it "belongs to user" do
      is_expected.to belong_to(:user)
    end
  end

  describe "is name" do
    it {is_expected.to validate_presence_of :name}
  end

  describe "is email" do
    it {is_expected.to validate_presence_of :email}
  end

  describe "is phone" do
    it {is_expected.to validate_presence_of :phone}
  end

  describe "is description" do
    it {is_expected.to validate_presence_of :description}
  end
end
