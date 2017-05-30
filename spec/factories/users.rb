# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "user#{n}"}
    password "password"
    password_confirmation "password"
  end
end
