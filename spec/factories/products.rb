FactoryGirl.define do
  factory :product do
    sequence(:title) { |n|"Some valid title #{n}"}
    description { Faker::Hipster.paragraph}
    price { 10 + rand(1000) }
    sale_price { price - 1 }
    # category { Category.order("RANDOM()").first }
    # user { User.order("RANDOM()").first }
    user
    category
  end
end
