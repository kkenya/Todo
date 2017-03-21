require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "factory girl" do
    user = FactoryGirl.create(:user)
    assert_equal "UserNo.1", user.name
  end
end
