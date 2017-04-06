FactoryGirl.define do
  factory :task do
    association :user
    sequence(:id)
    title = %w(model controller view deploy)
    sequence(:title) { |n| "#{title[n-1]}を作る" }
    memo "fight!"
    status %w(today week month)
  end
end