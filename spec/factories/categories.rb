FactoryGirl.define do
  factory :category do
    name "Test Category"
    description "Category created for the purpose of testing"
    
    trait :category_empty_info do
      name ""
      description ""
    end
  end
end
