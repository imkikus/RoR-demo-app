FactoryGirl.define do
  factory :order do
    status "cart"
    billing_address "#11/3, H.M.S.Layou"
    shipping_address "#11/3, H.M.S.Layout"
    subtotal "9.99"
    tax "9.99"
    total "9.99"
    association :user

    trait :order_status_invalid do
      status "Waiting"
      billing_address "#11/3, H.M.S.Layou"
      shipping_address "#11/3, H.M.S.Layout"
      subtotal "9.99"
      tax "9.99"
      total "9.99"
    end
    trait :order_status_empty do
      status ""
    end
  end

end
