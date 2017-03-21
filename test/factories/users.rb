FactoryGirl.define  do
  factory :user do
    sequence(:name) { |n| "UserNo.#{n}" }
  end
end