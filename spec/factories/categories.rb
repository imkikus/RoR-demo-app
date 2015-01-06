FactoryGirl.define do
  factory :category do
    name "Test Category"
    thumburl "http://www.example.com"
    
    trait :category_empty_info do
      name ""
      thumburl ""
    end
  end
end
