FactoryGirl.define do
  factory :line_item do
    unit_price 9.99
    quantity 2
    tax 9.99
    total 9.99
    association :order
    association :product

    trait :line_item_negative_values do
      unit_price -9.99
      quantity -9
      tax -9.99
      total -1.5
    end

    trait :line_item_invalid_quantity do
      quantity nil
    end    
  end

end
