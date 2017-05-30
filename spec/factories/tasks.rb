# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    user
    sequence(:title) { |n| "title#{n}"}
    sequence(:memo) { |n| "memo#{n}"}
  end
end
