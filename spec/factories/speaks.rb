# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :speack do
    user
    task
    sequence(:comment) { |n| "speack#{n}"}
  end
end
