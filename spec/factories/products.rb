FactoryGirl.define do
  factory :product do
    product_name "Product"
    description "Some text describing the product"
    price 10.00
    thumburl "http://www.example.com"
    tax_rate 12.24
    association :category

    trait :product_empty_info do
      product_name ""
      description ""
      price -10.00
      thumburl "example.com"
      tax_rate -12.24
    end
  end
end
