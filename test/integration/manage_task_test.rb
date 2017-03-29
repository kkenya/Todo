require 'test_helper'

class ManageTaskTest < ActionDispatch::IntegrationTest
  test "add an user" do
    get "/users/new"
    assert_response :success

    post "/users", params: { user: FactoryGirl.attributes_for(:user, name: "") }
    assert_template "new"
    assert_select "div button", true

    post "/users", params: { user: FactoryGirl.attributes_for(:user, name: "テスト記事") }
    assert_redirected_to assigns(:user)
    follow_redirect!
    assert_select "h1", "テスト記事さんの計画"
  end
end
