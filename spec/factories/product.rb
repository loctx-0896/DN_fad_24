FactoryBot.define do
  factory :product do
    sequence(:id) { |number| number }
    name {Faker::Name.name}
    description {Faker::Food.description}
    detail {Faker::Food.description}
    price { Faker::Number.between(10000, 50000) }
    status { 1 }
    category_id { 1 }
  end
end
