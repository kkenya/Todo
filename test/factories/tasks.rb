FactoryGirl.define do
  factory :task do
    title = %w(model controller view deploy)
    sequence(:title) { |n| "#{title[n-1]}を作る" }
    memo "fight!"
    released_at Time.current
    expired_at Time.current.beginning_of_day.advance(days: 1)
  end
end