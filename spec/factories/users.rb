FactoryGirl.define do
  factory :user do
    email "imkikus@gmail.com"
    password "password1"

    trait :user_empty_info do
      email ""
      password ""
    end
  end
end
