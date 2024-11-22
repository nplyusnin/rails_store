FactoryBot.define do
  factory :product do
    sequence(:title) { |i| "Product #{i}" }
    description { "MyText" }
    price { rand(1..1_000) }
  end
end
