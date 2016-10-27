FactoryGirl.define do
  factory :review do
    body { Faker::Hipster.paragraph }
    stars { 1 + rand(4) }
    # product { Product.order("RANDOM()").first }
    # user { User.order("RANDOM()").first }
    product
    user
  end
end
