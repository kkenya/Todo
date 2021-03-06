require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  def setup
    login_as("taro")
  end

  test "index" do
    logout
    5.times { FactoryGirl.build(:task) }
    get :index, params: { user_id: 1 }
    assert_response :success
  end

  test "new" do
    get :new, params: { user_id: 1 }
    assert_response :success
  end

  test "new before login" do
    logout
    assert_raise(ApplicationController::Forbidden) { get :new, params: { user_id: 1 } }
  end

  test "edit" do
    task = FactoryGirl.build(:task)
    get :edit, params: { task: { user_id: 1, id: task.id } }
    assert_response :success
  end

  test "create" do
    attrs = FactoryGirl.attributes_for(:task)
    post :create, params: { task: attrs }
    task = Task.order(:id).last
    assert_redirected_to :tasks
  end
end

#   test "update" do
#     task = FactoryGirl.create(:task)
#     patch :update, params: { id: task , task: FactoryGirl.attributes_for(:task) }
#     assert_redirected_to :tasks
#     assert_template "index"
#   end

#   test "fail to create" do
#     attrs = FactoryGirl.attributes_for(:task, title: "")
#     post :create, params: { task: attrs }
#     assert_response :success
#     assert_template "new"
#   end

#   test "fail to update" do
#     attrs = FactoryGirl.attributes_for(:task, status: "")
#     task = FactoryGirl.create(:task)
#     put :update, params: { id: task, task: attrs }
#     assert_response :success
#     assert_template "edit"
#   end

#   test "destroy" do
#     task = FactoryGirl.create(:task)
#     delete :destroy, params: { id: task }
#     assert_redirected_to :tasks
#     assert_raises(ActiveRecord::RecordNotFound) { Task.find(task.id) }
#   end
# end
