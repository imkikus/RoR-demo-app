FactoryGirl.define do
  factory :category do
    name "Test Category"
    thumburl "http://www.example.com"
    trait :category do
      name ""
      thumburl "example.com"
    end
  end

end
