require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "factory girl" do
    user = FactoryGirl.create(:user)
    assert_equal "UserNo.1", user.name
  end

  test "authenticate" do
    user = FactoryGirl.create(:user, name: "taro", password: "lucky", password_confirmation: "lucky")
    assert_nil User.authenticate("taro", "unlucky")
    assert_equal user, User.authenticate("taro", "lucky")
  end
end
