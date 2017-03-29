require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    login_as("taro")
    get :index
    assert_responce :success
  end

  test "index before login" do
    assert_raise(ApplicationController::Forbidden) { get :index }
  end

end
