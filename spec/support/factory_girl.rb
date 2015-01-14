require "factory_girl"

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end

  factory :team do
    name "name"
    user
    league
  end

  factory :commissioner, parent: :user do
    role "commissioner"
  end

  factory :league do
    name "name"
    password "password"
    member_amount 14
  end
end
