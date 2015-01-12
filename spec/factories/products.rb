FactoryGirl.define do
  factory :product do
    name "Product"
    description "Some text describing the product"
    price 9.99
    tax_rate 9.99
    image { File.new("#{Rails.root}/spec/fixtures/images/google.jpg") }
    association :category

    trait :product_empty_info do
      name ""
      description ""
      price nil
      tax_rate nil
      image nil
    end
  end
end
