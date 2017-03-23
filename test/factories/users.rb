FactoryGirl.define  do
  factory :user do
    sequence(:name) { |n| "UserNo.#{n}" }
    password "password"
    password_confirmation "password"
  end
end