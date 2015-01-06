FactoryGirl.define do
  factory :product do
    product_name "Product"
    description "Some text describing the product"
    price 9.99
    thumburl "http://www.example.com"
    tax_rate 9.99
    association :category

    trait :product_empty_info do
      product_name ""
      description ""
      price nil
      thumburl ""
      tax_rate nil
    end
  end
end
