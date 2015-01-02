FactoryGirl.define do
  factory :user do
    email "imkikus@gmail.com"
    password "password1"

    trait :user do
      email ""
      password ""
    end
  end

end
